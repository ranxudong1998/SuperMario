/****************************************************************************
** Meta object code from reading C++ file 'rank.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.12.3)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../SuperMario_S/rank.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'rank.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.12.3. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_Rank_t {
    QByteArrayData data[11];
    char stringdata0[101];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_Rank_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_Rank_t qt_meta_stringdata_Rank = {
    {
QT_MOC_LITERAL(0, 0, 4), // "Rank"
QT_MOC_LITERAL(1, 5, 14), // "mlevel1Changed"
QT_MOC_LITERAL(2, 20, 0), // ""
QT_MOC_LITERAL(3, 21, 14), // "mlevel2Changed"
QT_MOC_LITERAL(4, 36, 14), // "mlevel3Changed"
QT_MOC_LITERAL(5, 51, 8), // "loadGame"
QT_MOC_LITERAL(6, 60, 8), // "saveGame"
QT_MOC_LITERAL(7, 69, 7), // "mlevel1"
QT_MOC_LITERAL(8, 77, 7), // "Record*"
QT_MOC_LITERAL(9, 85, 7), // "mlevel2"
QT_MOC_LITERAL(10, 93, 7) // "mlevel3"

    },
    "Rank\0mlevel1Changed\0\0mlevel2Changed\0"
    "mlevel3Changed\0loadGame\0saveGame\0"
    "mlevel1\0Record*\0mlevel2\0mlevel3"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_Rank[] = {

 // content:
       8,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       3,   44, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       3,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x06 /* Public */,
       3,    0,   40,    2, 0x06 /* Public */,
       4,    0,   41,    2, 0x06 /* Public */,

 // methods: name, argc, parameters, tag, flags
       5,    0,   42,    2, 0x02 /* Public */,
       6,    0,   43,    2, 0x02 /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void,
    QMetaType::Void,

 // methods: parameters
    QMetaType::Bool,
    QMetaType::Bool,

 // properties: name, type, flags
       7, 0x80000000 | 8, 0x0049510b,
       9, 0x80000000 | 8, 0x0049510b,
      10, 0x80000000 | 8, 0x0049510b,

 // properties: notify_signal_id
       0,
       1,
       2,

       0        // eod
};

void Rank::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        auto *_t = static_cast<Rank *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->mlevel1Changed(); break;
        case 1: _t->mlevel2Changed(); break;
        case 2: _t->mlevel3Changed(); break;
        case 3: { bool _r = _t->loadGame();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        case 4: { bool _r = _t->saveGame();
            if (_a[0]) *reinterpret_cast< bool*>(_a[0]) = std::move(_r); }  break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        {
            using _t = void (Rank::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Rank::mlevel1Changed)) {
                *result = 0;
                return;
            }
        }
        {
            using _t = void (Rank::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Rank::mlevel2Changed)) {
                *result = 1;
                return;
            }
        }
        {
            using _t = void (Rank::*)();
            if (*reinterpret_cast<_t *>(_a[1]) == static_cast<_t>(&Rank::mlevel3Changed)) {
                *result = 2;
                return;
            }
        }
    } else if (_c == QMetaObject::RegisterPropertyMetaType) {
        switch (_id) {
        default: *reinterpret_cast<int*>(_a[0]) = -1; break;
        case 2:
        case 1:
        case 0:
            *reinterpret_cast<int*>(_a[0]) = qRegisterMetaType< Record* >(); break;
        }
    }

#ifndef QT_NO_PROPERTIES
    else if (_c == QMetaObject::ReadProperty) {
        auto *_t = static_cast<Rank *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: *reinterpret_cast< Record**>(_v) = _t->mlevel1(); break;
        case 1: *reinterpret_cast< Record**>(_v) = _t->mlevel2(); break;
        case 2: *reinterpret_cast< Record**>(_v) = _t->mlevel3(); break;
        default: break;
        }
    } else if (_c == QMetaObject::WriteProperty) {
        auto *_t = static_cast<Rank *>(_o);
        Q_UNUSED(_t)
        void *_v = _a[0];
        switch (_id) {
        case 0: _t->setMlevel1(*reinterpret_cast< Record**>(_v)); break;
        case 1: _t->setMlevel2(*reinterpret_cast< Record**>(_v)); break;
        case 2: _t->setMlevel3(*reinterpret_cast< Record**>(_v)); break;
        default: break;
        }
    } else if (_c == QMetaObject::ResetProperty) {
    }
#endif // QT_NO_PROPERTIES
}

QT_INIT_METAOBJECT const QMetaObject Rank::staticMetaObject = { {
    &QObject::staticMetaObject,
    qt_meta_stringdata_Rank.data,
    qt_meta_data_Rank,
    qt_static_metacall,
    nullptr,
    nullptr
} };


const QMetaObject *Rank::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *Rank::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_Rank.stringdata0))
        return static_cast<void*>(this);
    return QObject::qt_metacast(_clname);
}

int Rank::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
#ifndef QT_NO_PROPERTIES
   else if (_c == QMetaObject::ReadProperty || _c == QMetaObject::WriteProperty
            || _c == QMetaObject::ResetProperty || _c == QMetaObject::RegisterPropertyMetaType) {
        qt_static_metacall(this, _c, _id, _a);
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyDesignable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyScriptable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyStored) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyEditable) {
        _id -= 3;
    } else if (_c == QMetaObject::QueryPropertyUser) {
        _id -= 3;
    }
#endif // QT_NO_PROPERTIES
    return _id;
}

// SIGNAL 0
void Rank::mlevel1Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void Rank::mlevel2Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 1, nullptr);
}

// SIGNAL 2
void Rank::mlevel3Changed()
{
    QMetaObject::activate(this, &staticMetaObject, 2, nullptr);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
