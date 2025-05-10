/*
 * Copyright (c) Huawei Technologies Co., Ltd. 2024-2025. All rights reserved.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <cstddef>
#include <cstdlib>
#include <js_native_api.h>
#include <js_native_api_types.h>
#include <node_api.h>
#include <securec.h>
#include <string>
#include <sys/wait.h>
#include <unistd.h>
#include "napi/native_api.h"

constexpr int MAX_BUFFER_SIZE = 128;
constexpr const char *UBSAN_LOG_FILE_PATH = "/data/storage/el2/log/ubsanXtsLog.com.thirdparty.ubsan.napitest";

static std::string GetBuffer(int pid)
{
    std::string buffer;
    char file[MAX_BUFFER_SIZE];
    int filePathRes = snprintf_s(file, sizeof(file), sizeof(file) - 1, "%s.%d", UBSAN_LOG_FILE_PATH, pid);
    if (filePathRes < 0) {
        return buffer;
    }
    FILE *fp = fopen(file, "r+");
    if (!fp) {
        return buffer;
    }
    if (fseek(fp, 0, SEEK_END) == -1) {
        return buffer;
    }
    int size = ftell(fp);
    if (size <= 0) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    buffer.resize(size);
    if (fseek(fp, 0, SEEK_SET) == -1) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    int rsize = fread(&buffer[0], 1, size, fp);
    if (rsize == 0) {
        ftruncate(fileno(fp), 0);
        rewind(fp);
        fclose(fp);
        return buffer;
    }
    ftruncate(fileno(fp), 0);
    rewind(fp);
    fclose(fp);
    return buffer;
}

static bool CheckUBSanLog(const std::string& errType, const std::string& buffer)
{
    if (buffer.empty()) {
        return false;
    }
    bool checkEventTypeFail = buffer.find(errType.c_str()) == std::string::npos;
    if (checkEventTypeFail) {
        return false;
    }
    return true;
}
// To detect reads from, or writes to, a misaligned pointer,
// or when you create a misaligned reference.
// A pointer misaligns if its address isn’t a multiple of its type’s alignment.
__attribute__((optnone)) static napi_value MisAlign(napi_env env, napi_callback_info info)
{
    // deliberately convert in C-style cast to trigger UBSan check
    signed short int *buffer = (signed short int *)malloc(64);
    if (buffer == nullptr) {
        return nullptr;
    }
    signed long int *pointer = reinterpret_cast<signed long int *>(buffer + 1);
    *pointer = 42; // 42 is an arbitrary number to deliberately trigger UBSan check
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:94:5", bufferLog) &&
        CheckUBSanLog("runtime error: store to misaligned address", bufferLog) &&
        CheckUBSanLog("for type 'long', which requires 8 byte alignment", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To access indexes that exceed the array’s bounds.
__attribute__((optnone)) static napi_value Bounds(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int array[5] = {0};
    int res = array[param];
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:114:15", bufferLog) &&
        CheckUBSanLog("runtime error: index 5 out of bounds for type 'int[5]'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect integer and float division where the divisor is zero.
__attribute__((optnone)) static napi_value IntegerDivBy0(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int res = 2 / param; // deliberately assign divisor to 0 to trigger UBSan check
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:132:17", bufferLog) &&
        CheckUBSanLog("runtime error: division by zero", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect accesses of an enumeration variable
// when its value isn’t within the valid range for the type.
// This can occur for uninitialized enumeration values,
// or when using an integer as an enumeration value without an appropriate cast.
enum E {
    A = 1,
    B = 2
};

__attribute__((optnone)) static napi_value EnumSan(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    // deliberately convert from integer to enum to trigger the undefined behavior of enum
    enum E *e = reinterpret_cast<enum E*>(&param);
    if (*e == A) {
        int res = 1;
    }
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:160:9", bufferLog) &&
        CheckUBSanLog("runtime error: load of value 42, which is not a valid value for type 'enum E'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect out-of-range casts to, from, or between floating-point types.
__attribute__((optnone)) static napi_value FloatCastOverflow(napi_env env, napi_callback_info info)
{
    // deliberately convert from double to integer
    // to trigger the undefined behavior of float-cast-overflow
    double n = 10e50;
    int res = static_cast<int>(n);
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:178:32", bufferLog) &&
        CheckUBSanLog("runtime error: 1e+51 is outside the range of representable values of type 'int'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect signed integer overflows in addition, subtraction, multiplication, and division.
__attribute__((optnone)) static napi_value SignedIntegerOverflow(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int res = param * 42; // 42 is an arbitrary number to deliberately trigger UBSan check
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:196:21", bufferLog) &&
    CheckUBSanLog("runtime error: signed integer overflow: 1073741824 * 42 cannot be represented in type 'int'",
    bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

struct Animal {
    virtual const char* Speak() = 0;
};

struct Cat: public Animal {
    const char* Speak() override
    {
        return "meow";
    }
};

struct Dog: public Animal {
    const char* Speak() override
    {
        return "woof";
    }
};

const char* Vptr(Animal* obj)
{
    auto *dog = reinterpret_cast<Dog*>(obj);
    return dog->Speak();
}

// To detect when an object has the wrong dynamic type.
__attribute__((optnone)) static napi_value VptrCheck(napi_env env, napi_callback_info info)
{
    Vptr(new Cat);
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:228:17", bufferLog) &&
        CheckUBSanLog("runtime error: member call on address", bufferLog) &&
        CheckUBSanLog("which does not point to an object of type 'Dog'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect when a function that has an argument with the nonnull attribute receives a null value.
__attribute__((optnone)) int Foo0(__attribute__((nonnull)) void *p)
{
    return 1;
}

__attribute__((optnone)) static napi_value NonnullAttribute(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    void* arr[3] = {nullptr, malloc(4), nullptr};
    int param;
    napi_get_value_int32(env, args[0], &param);
    int res = Foo0(arr[param]);
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:259:20", bufferLog) &&
                        CheckUBSanLog("runtime error: null pointer passed as argument 1, " \
                                      "which is declared to never be null", bufferLog) &&
                        CheckUBSanLog("napi_init.cpp:246:50", bufferLog) &&
                        CheckUBSanLog("note: nonnull attribute specified here", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect the creation of null references and null pointer dereferences.
// If the compiler finds a pointer dereference, it treats that pointer as nonnull.
// As a result, the optimizer may remove null equality checks for dereferenced pointers.
__attribute__((optnone)) int& Foo1(int *x)
{
    return *(int *)x; // deliberately use of a null pointer to trigger the undefined behavior of null
}

__attribute__((optnone)) static napi_value NullSanitize(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        // deliberately convert in C-style cast to trigger UBSan check
        int* arr[3] = {nullptr, (int *)malloc(4), nullptr};
        int param;
        napi_get_value_int32(env, args[0], &param);
        Foo1(arr[param]);
        exit(0);
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:277:12", bufferLog) &&
        CheckUBSanLog("runtime error: reference binding to null pointer of type 'int'", bufferLog);
    checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect pointer casts when the size of the source type
// is less than the size of the destination type.
class Base {
};
class Derived : public Base {
public:
    Derived() : pad2(1) {}
    int pad2;
};

// To detect the pointer arithmetic which overflows,
// or where either the old or new pointer value is a null pointer
__attribute__((optnone)) int* Foo2(int i)
{
    int *p = reinterpret_cast<int *>(UINTPTR_MAX);
    return p + i;
}

__attribute__((optnone)) static napi_value PointerOverflow(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        int param;
        napi_get_value_int32(env, args[0], &param);
        *(Foo2(param));
        exit(0);
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
        bool findUBSanLog = CheckUBSanLog("napi_init.cpp:325:14", bufferLog) &&
        CheckUBSanLog("runtime error: pointer index expression with base 0xffffffffffffffff " \
                      "overflowed to 0x00000000000f", bufferLog);
    checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect when a function with the returns_nonnull attribute returns null.
__attribute__((nonnull)) int *Foo3(int *p)
{
    return p;
}

__attribute__((optnone)) static napi_value ReturnNonnullAttribute(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    // deliberately convert in C-style cast to trigger UBSan check
    int* arr[3] = {nullptr, (int *)malloc(sizeof(int)), nullptr};
    int param;
    napi_get_value_int32(env, args[0], &param);
    Foo3(arr[param]);
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:372:10", bufferLog) &&
                        CheckUBSanLog("runtime error: null pointer passed as argument 1, " \
                                      "which is declared to never be null", bufferLog) &&
                        CheckUBSanLog("napi_init.cpp:358:16", bufferLog) &&
                        CheckUBSanLog("note: nonnull attribute specified here", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect bitwise shifts with invalid shift amounts and shifts that might overflow
// shift-base is to check only left-hand side of shift operation
__attribute__((optnone)) static napi_value ShiftBase(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int x = 1;
    int res = x << param;
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:395:17", bufferLog) &&
        CheckUBSanLog("runtime error: shift exponent 32 is too large for 32-bit type 'int'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect bitwise shifts with invalid shift amounts and shifts that might overflow
// shift-base is to check only left-hand negative
__attribute__((optnone)) static napi_value ShiftBaseNegative(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int x = 1;
    int res = x << param;
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:415:17", bufferLog) &&
        CheckUBSanLog("runtime error: shift exponent -2 is negative", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// shift-exponent is to check only right-hand side of shift operation
__attribute__((optnone)) static napi_value ShiftExponent(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int x = -1;
    int res = x >> param;
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:434:17", bufferLog) &&
        CheckUBSanLog("runtime error: shift exponent 32 is too large for 32-bit type 'int'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// shift-exponent is to check only right-hand side of shift operation negative
__attribute__((optnone)) static napi_value ShiftExponentNegative(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int x = 1;
    int res = x >> param;
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:453:17", bufferLog) &&
        CheckUBSanLog("runtime error: shift exponent -2 is negative", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// shift-exponent is to check only right-hand side of shift operation bound
__attribute__((optnone)) static napi_value ShiftExponentBound(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int x = 1;
    int res = x >> param;
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:472:17", bufferLog) &&
        CheckUBSanLog("runtime error: shift exponent 32 is too large for 32-bit type 'int'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect accesses to a Boolean variable when its value isn’t true or false.
// This problem can occur when using an integer or pointer without an appropriate cast.
__attribute__((optnone)) static napi_value UndefinedBool(napi_env env, napi_callback_info info)
{
    int res = -1;
    // deliberately convert from integer to bool
    // to trigger the undefined behavior of float-cast-overflow
    int x = 42;
    bool *predicate = reinterpret_cast<bool *>(&x);
    if (*predicate) {
        res = 1;
    } else {
        res = 0;
    }
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:491:9", bufferLog) &&
        CheckUBSanLog("runtime error: load of value 42, which is not a valid value for type 'bool'", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// To detect negative array bounds.
__attribute__((optnone)) static napi_value VlaBound(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        int param;
        napi_get_value_int32(env, args[0], &param);
        int vla[param];
        exit(0);
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:520:17", bufferLog) &&
        CheckUBSanLog("runtime error: variable length array bound evaluates to non-positive value -1", bufferLog);
    checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

// funcation unreachable
__attribute__((optnone)) static napi_value Unreachable(napi_env env, napi_callback_info info)
{
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        __builtin_unreachable();
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:544:9", bufferLog) &&
        CheckUBSanLog("runtime error: execution reached an unreachable program point", bufferLog);
    checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) int ReturnNull(int a) {}
// funcation no return
__attribute__((optnone)) static napi_value NoReturn(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int status;
    int pid = fork();
    int checkRes = 0;
    if (pid == -1) {
        napi_value result = nullptr;
        napi_create_int32(env, checkRes, &result);
    } else if (pid == 0) {
        int param;
        napi_get_value_int32(env, args[0], &param);
        ReturnNull(param);
    } else {
        wait(&status);
    }
    std::string bufferLog = GetBuffer(pid);
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:557:30", bufferLog) &&
    CheckUBSanLog("runtime error: execution reached the end of a value-returning function without returning a value",
        bufferLog);
    checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value ShiftBaseIntMax(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int x = -1;
    int res = param << x;
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:595:21", bufferLog) &&
        CheckUBSanLog("runtime error: shift exponent -1 is negative", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

__attribute__((optnone)) static napi_value ShiftBaseIntMin(napi_env env, napi_callback_info info)
{
    size_t argc = 1;
    napi_value args[1] = {nullptr};
    napi_get_cb_info(env, info, &argc, args, nullptr, nullptr);
    int param;
    napi_get_value_int32(env, args[0], &param);
    int x = 1;
    int res = param << x;
    std::string bufferLog = GetBuffer(getpid());
    bool findUBSanLog = CheckUBSanLog("napi_init.cpp:613:21", bufferLog) &&
        CheckUBSanLog("runtime error: left shift of negative value -2147483648", bufferLog);
    int checkRes = findUBSanLog ? 1 : 0;
    napi_value result = nullptr;
    napi_create_int32(env, checkRes, &result);
    return result;
}

EXTERN_C_START
static napi_value Init(napi_env env, napi_value exports)
{
    napi_property_descriptor desc[] = {
        { "misAlign", nullptr, MisAlign, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "bounds", nullptr, Bounds, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "integerDivBy0", nullptr, IntegerDivBy0, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "enumSan", nullptr, EnumSan, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "floatCastOverflow", nullptr, FloatCastOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "signedIntegerOverflow", nullptr, SignedIntegerOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "vptrCheck", nullptr, VptrCheck, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nonnullAttribute", nullptr, NonnullAttribute, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "nullSanitize", nullptr, NullSanitize, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "pointerOverflow", nullptr, PointerOverflow, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "returnNonnullAttribute", nullptr, ReturnNonnullAttribute, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftBase", nullptr, ShiftBase, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftBaseNegative", nullptr, ShiftBaseNegative, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftExponent", nullptr, ShiftExponent, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftExponentNegative", nullptr, ShiftExponentNegative, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftExponentBound", nullptr, ShiftExponentBound, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "undefinedBool", nullptr, UndefinedBool, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "vlaBound", nullptr, VlaBound, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "unreachable", nullptr, Unreachable, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "noReturn", nullptr, NoReturn, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftBaseIntMax", nullptr, ShiftBaseIntMax, nullptr, nullptr, nullptr, napi_default, nullptr },
        { "shiftBaseIntMin", nullptr, ShiftBaseIntMin, nullptr, nullptr, nullptr, napi_default, nullptr }
    };
    napi_define_properties(env, exports, sizeof(desc) / sizeof(desc[0]), desc);
    return exports;
}
EXTERN_C_END

static napi_module demoModule = {
    .nm_version = 1,
    .nm_flags = 0,
    .nm_filename = nullptr,
    .nm_register_func = Init,
    .nm_modname = "entry",
    .nm_priv = ((void*)0),
    .reserved = { 0 },
};

extern "C" __attribute__((constructor)) void RegisterEntryModule(void)
{
    napi_module_register(&demoModule);
}
