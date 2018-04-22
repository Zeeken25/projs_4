#ifndef COMMUNICAT_H
#define COMMUNICAT_H

#include <QObject>
#include <QDebug>
#include <QPoint>
#include <QQmlApplicationEngine>


class Communicat : public QObject
{
    Q_OBJECT
public:
    explicit Communicat(QObject *parent = nullptr);
    Q_INVOKABLE void testDebug(QString text);
    Q_INVOKABLE int objectCreated(int text);
    Q_INVOKABLE int getLineX(int num);
    Q_INVOKABLE int getLineY(int num);



signals:

public slots:

private:
    QQmlApplicationEngine* engine;

};

#endif // COMMUNICAT_H
