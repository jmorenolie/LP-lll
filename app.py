from flask import Flask, render_template, request, redirect, session, g
import psycopg2
from werkzeug.security import check_password_hash
from dotenv import load_dotenv
from os import environ

load_dotenv()

app = Flask(__name__)
app.secret_key = 'peyuyi0611'


def get_db_connection():
    conn = psycopg2.connect(
        host="linea.postgres.database.azure.com",
        database="postgres",
        port='5432',
        user="jmorenolievano",
        password="Juanjose1"
    )
    return conn

def close_db_connection(conn):
    conn.close()

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        contraseña = request.form['contraseña']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("SELECT email, contraseña FROM colegio WHERE email = %s", (email,))
        usuario = cur.fetchone()
        cur.close()
        close_db_connection(conn)

        if usuario is not None and usuario[1] == contraseña:
            session['email'] = usuario[0]
            return redirect('/dashboard')
        else:
            error = 'Email o contraseña incorrectos'
            return render_template('login.html', error=error)

    return render_template('login.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        nombre = request.form['nombre']
        email = request.form['email']
        contraseña = request.form['contraseña']

        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("INSERT INTO colegio (nombre, email, contraseña) VALUES (%s, %s, %s)",
                    (nombre, email, contraseña))
        conn.commit()
        cur.close()
        close_db_connection(conn)

        session['email'] = email
        return redirect('/dashboard')

    return render_template('register.html')

@app.route('/dashboard')
def dashboard():
    if 'email' in session:
        return render_template('dashboard.html')
    else:
        return redirect('/login')

@app.route('/logout')
def logout():
    session.pop('email', None)
    return redirect('/login')

############################################################################Estudiantes
@app.route('/estudiantes')
def estudiantes():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM estudiantes")
    estudiantes = cur.fetchall()
    cur.close()
    close_db_connection(conn)
    return render_template('estudiantes.html', estudiantes=estudiantes)

@app.route('/estudiantes/agregar', methods=['GET', 'POST'])
def agregar_estudiante():
    if request.method == 'POST':
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        id_colegio = request.form['id_colegio']
        grado = request.form['grado']
        
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("INSERT INTO estudiantes (nombres, apellidos, id_colegio, grado) VALUES (%s, %s, %s, %s)",
                    (nombres, apellidos, id_colegio, grado))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/estudiantes')
    
    return render_template('agregar_estudiante.html')

@app.route('/estudiantes/editar/<int:id>', methods=['GET', 'POST'])
def editar_estudiante(id):
    conn = get_db_connection()
    cur = conn.cursor()
    
    if request.method == 'POST':
        nombre = request.form['nombre']
        apellidos = request.form['apellidos']
        id_colegio = request.form['id_colegio']
        grado = request.form['grado']
        
        cur.execute("UPDATE estudiantes SET nombres = %s, apellidos = %s, id_colegio = %s, grado = %s WHERE id_estudiante = %s",
                    (nombre, apellidos, id_colegio, grado, id))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/estudiantes')
    
    cur.execute("SELECT * FROM estudiantes WHERE id_estudiante = %s", (id,))
    estudiante = cur.fetchone()
    cur.close()
    close_db_connection(conn)
    
    return render_template('editar_estudiante.html', estudiante=estudiante)

@app.route('/estudiantes/eliminar/<int:id>', methods=['GET', 'POST'])
def eliminar_estudiantes(id):
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        cur.execute("DELETE FROM estudiantes WHERE id_estudiante = %s", (id,))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/estudiantes')

    cur.execute("SELECT * FROM estudiantes WHERE id_estudiante = %s", (id,))
    estudiante = cur.fetchone()
    cur.close()
    close_db_connection(conn)

    return render_template('eliminar_estudiante.html', estudiante=estudiante)

############################################################################################### FIN ESTUDIANTES

############################################Profesores
@app.route('/profesores')
def profesores():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM profesores")
    profesores = cur.fetchall()
    cur.close()
    close_db_connection(conn)
    return render_template('profesores.html', profesores=profesores)

@app.route('/profesores/agregar', methods=['GET', 'POST'])
def agregar_profesores():
    if request.method == 'POST':
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        id_colegio = request.form['id_colegio']
        area = request.form['area']
        
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("INSERT INTO profesores (nombres, apellidos, id_colegio, Área) VALUES (%s, %s, %s, %s)",
                    (nombres, apellidos, id_colegio, area))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/profesores')
    
    return render_template('agregar_profesores.html')

@app.route('/profesores/editar/<int:id>', methods=['GET', 'POST'])
def editar_profesores(id):
    conn = get_db_connection()
    cur = conn.cursor()
    
    if request.method == 'POST':
        nombres = request.form['nombres']
        apellidos = request.form['apellidos']
        id_colegio = request.form['id_colegio']
        area = request.form['area']
        
        cur.execute("UPDATE profesores SET nombres = %s, apellidos = %s, id_colegio = %s, Área = %s WHERE id_profesor = %s",
                    (nombres, apellidos, id_colegio, area, id))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/profesores')
    
    cur.execute("SELECT * FROM profesores WHERE id_profesor = %s", (id,))
    profesores = cur.fetchone()
    cur.close()
    close_db_connection(conn)
    
    return render_template('editar_profesor.html', profesores=profesores)

@app.route('/profesores/eliminar/<int:id>', methods=['GET', 'POST'])
def eliminar_profesor(id):
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        cur.execute("DELETE FROM profesores WHERE id_profesor = %s", (id,))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/profesores')

    cur.execute("SELECT * FROM profesores WHERE id_profesor = %s", (id,))
    profesor = cur.fetchone()
    cur.close()
    close_db_connection(conn)

    return render_template('eliminar_profesor.html', profesor=profesor)

######################################################################  MATERIAS
@app.route('/materias')
def materias():
    conn = get_db_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM materias")
    materias = cur.fetchall()
    cur.close()
    close_db_connection(conn)
    return render_template('materias.html', materias=materias)

@app.route('/materias/agregar', methods=['GET', 'POST'])
def agregar_materias():
    if request.method == 'POST':
        nombre_materia = request.form['nombre_materia']
        descripción = request.form['descripción']
        id_colegio = request.form['id_colegio']
        
        conn = get_db_connection()
        cur = conn.cursor()
        cur.execute("INSERT INTO materias (nombre_materia, descripción, id_colegio) VALUES (%s, %s, %s)",
                    (nombre_materia, descripción, id_colegio))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/materias')
    
    return render_template('agregar_materias.html')

@app.route('/materias/editar/<int:id>', methods=['GET', 'POST'])
def editar_materias(id):
    conn = get_db_connection()
    cur = conn.cursor()
    
    if request.method == 'POST':
        nombre_materia = request.form['nombre_materia']
        descripción = request.form['descripción']
        id_colegio = request.form['id_colegio']
        
        cur.execute("UPDATE materias SET nombre_materia = %s, descripción = %s, id_colegio = %s WHERE id_materia = %s",
                    (nombre_materia, descripción, id_colegio, id))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/materias')
    
    cur.execute("SELECT * FROM materias WHERE id_materia = %s", (id,))
    materias = cur.fetchone()
    cur.close()
    close_db_connection(conn)
    
    return render_template('editar_materias.html', materias=materias)

@app.route('/materias/eliminar/<int:id>', methods=['GET', 'POST'])
def eliminar_materias(id):
    conn = get_db_connection()
    cur = conn.cursor()

    if request.method == 'POST':
        cur.execute("DELETE FROM materias WHERE id_materia = %s", (id,))
        conn.commit()
        cur.close()
        close_db_connection(conn)
        return redirect('/materias')

    cur.execute("SELECT * FROM materias WHERE id_materia = %s", (id,))
    materias = cur.fetchone()
    cur.close()
    close_db_connection(conn)

    return render_template('eliminar_materias.html', materias=materias)


if __name__ == '__main__':
    app.run(debug=True)
