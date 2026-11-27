from flask import Flask, jsonify, request
import mysql.connector

app = Flask(__name__)


def get_conn():
    # il MySQL nel container Docker (sezione 1)
    return mysql.connector.connect(
        host="127.0.0.1", user="root",
        password="root", database="fantaf1")


def riga_to_dict(r):
    return {"id": r[0], "nome": r[1],
            "valore": float(r[2]),
            "valore_crediti": float(r[3])}


@app.get("/api/piloti")
def lista_piloti():
    conn = get_conn()
    cur = conn.cursor()
    cur.execute("SELECT id, nome, valore, "
                "valore * 10 AS valore_crediti "
                "FROM piloti")
    righe = cur.fetchall()
    cur.close(); conn.close()
    piloti = [riga_to_dict(r) for r in righe]
    return jsonify(piloti), 200