#ifndef LOGINOP_H
#define LOGINOP_H

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
    Q_PROPERTY(QString handledUser READ handledUserText WRITE handledUserSet NOTIFY handledUserChanged);
    Q_PROPERTY(bool correction READ correctionText WRITE correctionSet NOTIFY correctionChanged);

    bool correction;

    QString handledUserText() const{
        return handledUser;
    }

    bool correctionText() const{
        return correction;
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

private:
    QStringList userList;
    QString handledUser;

signals:
    void handledUserChanged(const QString & handledUser);
    void correctionChanged(const bool & correction);
};

#endif // LOGINOP_H
