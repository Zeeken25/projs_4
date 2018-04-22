#include "communicat.h"

Communicat::Communicat(QObject *parent) : QObject(parent)
{

}

void Communicat::testDebug(QString text)
{
    qDebug() << "QML test:" << text;
}

int Communicat::objectCreated(int text)
{
    qDebug() << "QML created:" << text;
    return 2;
}

int Communicat::getLineX(int num)
{
     qDebug() << 50;
     return 50;
}

int Communicat::getLineY(int num)
{
     qDebug() << 100;
     return 100;
}

