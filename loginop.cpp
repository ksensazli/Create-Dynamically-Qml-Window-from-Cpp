#include "loginop.h"

loginOp::loginOp(QObject *parent) : QObject{parent}
{
    setFile();
}

void loginOp::userCheck(const QString &username, const QString &password)
{
    setFile();

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
    setFile();
    QString tempUser;

    for(int i=0; i<userList.length(); i+=2)
    {
        if(userList.at(i) == username)
        {
            tempUser = username;
            isAlreadyExist = true;
            break;
        }

        else
        {
            isAlreadyExist = false;
        }
    }

    if(tempUser == username)
    {
        qDebug() << tempUser << "already registered!";
    }
    else if(password == rePassword)
    {
        qDebug() << username << "registered successfully!";
        QFile out(PROJECT_PATH "/database.csv");
        out.open(QIODevice::ReadWrite | QIODevice::Append);
        QTextStream outStream(&out);
        outStream << "\n" + username + ";" + password;
        out.close();
    }
}

void loginOp::setFile()
{
    QFile file(PROJECT_PATH "/database.csv");
    file.open(QIODevice::ReadOnly);
    QTextStream stream(&file);
    userList = stream.readAll().split(QRegExp("[\r\n';']"), QString::SkipEmptyParts);
    file.close();
}
