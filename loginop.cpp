#include "loginop.h"

loginOp::loginOp(QObject *parent) : QObject{parent}
{
    QFile file("/Users/ksensazli/Qt_Projects/loginSystem/database.csv");
    file.open(QIODevice::ReadOnly);
    QTextStream stream(&file);
    userList = stream.readAll().split(QRegExp("[\r\n';']"), QString::SkipEmptyParts);
    file.close();
}

void loginOp::userCheck(const QString &username, const QString &password)
{
    for(int i=0; i<userList.length(); i+=2)
    {
        if(userList.at(i) == username && userList.at(i+1) == password)
        {
            qDebug() << "Success for" << username;
            handledUser = username;
            correction = 1;
            break;
        }
        else {
            correction = 0;
        }
    }
}
