# Messung von  I, V und plotten
while True:
    # Reset und Start
    osc[0].reset()
    osc[0].start()

    # Auf Daten warten
    while (osc[0].status_run()):
        pass

    V0 = osc[0].data(N-100)  # IN1 Signal
    V1 = osc[1].data(N-100)  # IN2 Signal
    I = ((V0-V1)/R1)*1E3     # 1E3 Umwandlung zu mA
    r.data_source.data['x'] = V0
    r.data_source.data['y'] = I

    push_notebook(handle=target)
