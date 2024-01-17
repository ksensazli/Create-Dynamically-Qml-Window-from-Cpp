#include "loginop.h"

loginOp::loginOp(QObject *parent) : QObject{parent}
{

}

void loginOp::userCheck(const QString &username, const QString &password)
{
    QFile file("/Users/ksensazli/Qt_Projects/loginSystem/database.csv");
    file.open(QIODevice::ReadOnly);
    QTextStream stream(&file);
    userList = stream.readAll().split(QRegExp("[\r\n';']"), QString::SkipEmptyParts);
    file.close();

    for(int i=0; i<userList.length(); i+=2)
    {
        if(userList.at(i) == username && userList.at(i+1) == password)
        {
            handledUser = username;
            correction = true;
            break;
        }
        else {
            correction = false;
        }
    }
}

void loginOp::userRegister(const QString &username, const QString &password, const QString &rePassword)
{
    if(password == rePassword)
    {
        QFile out("/Users/ksensazli/Qt_Projects/loginSystem/database.csv");
        out.open(QIODevice::WriteOnly | QIODevice::Append);
        QTextStream outStream(&out);
        outStream << "\n" + username + ";" + password;
        out.close();
        isRegister = true;
    }
    else {
        isRegister = false;
    }
}
