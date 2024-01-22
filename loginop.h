#ifndef LOGINOP_H
#define LOGINOP_H

#include <QDir>
#include <QFile>
#include <QDebug>
#include <QObject>
#include <QRegExp>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQuickWindow>
#include <QQmlComponent>
#include <QGuiApplication>
#include <QQmlApplicationEngine>

class loginOp : public QObject
{
    Q_OBJECT
public:
    explicit loginOp(QObject *parent = nullptr);

    Q_INVOKABLE void userCheck(const QString &username, const QString &password);
    Q_INVOKABLE void userRegister(const QString &username, const QString &password, const QString &rePassword);

    void setFile();

    Q_PROPERTY(QString handledUser READ handledUserText WRITE handledUserSet NOTIFY handledUserChanged);
    Q_PROPERTY(bool correction READ correctionText WRITE correctionSet NOTIFY correctionChanged);
    Q_PROPERTY(bool isAlreadyExist READ isAlreadyExistText WRITE isAlreadyExistSet NOTIFY isAlreadyExistChanged);

    bool correction;
    bool isAlreadyExist = false;

    QString handledUserText() const{
        return handledUser;
    }

    bool correctionText() const{
        return correction;
    }

    bool isAlreadyExistText() const{
        return isAlreadyExist;
    }

    void handledUserSet(const QString &handledUserText){
        if(handledUserText == handledUser)
            return;
        handledUser = handledUserText;
        emit handledUserChanged(handledUser);
    }

    void correctionSet(const bool &correctionText){
        if(correctionText == correction)
            return;
        correction = correctionText;
        emit correctionChanged(correction);
    }

    void isAlreadyExistSet(const bool &isAlreadyExistText){
        if(isAlreadyExistText == isAlreadyExist)
            return;
        isAlreadyExist = isAlreadyExistText;
        emit isAlreadyExistChanged(isAlreadyExist);
    }

private:
    QStringList userList;
    QString handledUser;

signals:
    void handledUserChanged(const QString & handledUser);
    void correctionChanged(const bool & correction);
    void isAlreadyExistChanged(const bool & isAlreadyExist);
};

#endif // LOGINOP_H
