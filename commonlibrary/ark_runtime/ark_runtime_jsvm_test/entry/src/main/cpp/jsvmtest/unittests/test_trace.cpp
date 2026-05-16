/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
#ifdef TEST_TRACE
#include <fstream>
#include <iostream>

#if defined(OHOS_JSVMTEST_XTS)
#define USE_HEADER_WASM
#endif

#include "jsvmtest.h"

#if defined(USE_HEADER_WASM)
#include <unordered_map>
namespace {
#include "add.wasm.def"

static const std::string wasmPath = "";

using WasmMap = std::unordered_map<std::string, std::pair<unsigned char *, unsigned int>>;
const WasmMap &InitWasmMap()
{
    static WasmMap wasmMap{};
    if (wasmMap.size() == 0) {
        wasmMap["add.wasm"] = std::pair<unsigned char *, unsigned int>(add_wasm, add_wasm_len);
    }
    return wasmMap;
}
}
#elif defined(OHOS_JSVM_HAP)
static const std::string wasmPath = "/data/storage/el1/base/wasm/";
#else
static const std::string wasmPath = "./unittests/wasm/";
#endif

static bool IsWasmModuleObject(JSVM_Value value)
{
    bool result;
    JSVM_CALL(OH_JSVM_IsWasmModuleObject(jsvm_env, value, &result));
    return result;
}

static bool IsWebAssemblyInstance(JSVM_Value value)
{
    auto Instance = jsvm::GetProperty(jsvm::Global("WebAssembly"), "Instance");
    return jsvm::InstanceOf(value, Instance);
}

static void ReadBinaryFile(const char *path, std::vector<uint8_t> &buffer)
{
#if !defined(USE_HEADER_WASM)
    std::ifstream infile(path, std::ifstream::binary);
    CHECK_FATAL(infile.good(), "can not access file: %s\n", path);
    infile.seekg(0, std::ifstream::end);
    size_t size = infile.tellg();
    infile.seekg(0);
    buffer.resize(size);
    infile.read(reinterpret_cast<char *>(&buffer[0]), size);
    infile.close();
#else
    const auto &wasmMap = InitWasmMap();
    auto it = wasmMap.find(path);
    if (it == wasmMap.end()) {
        CHECK_FATAL(false, "can not find file: %s", path);
    }
    auto p = it->second;
    std::vector<uint8_t> newBuffer((uint8_t *)p.first, p.first + p.second);
    buffer.swap(newBuffer);
#endif
}

static void ReadBinaryFile(const std::string &path, std::vector<uint8_t> &buffer)
{
    ReadBinaryFile(path.c_str(), buffer);
}

static JSVM_Value InstantiateWasmModule(JSVM_Value wasmModule, JSVM_Value importedObject)
{
    auto globalThis = jsvm::Global();
    auto WebAssembly = jsvm::GetProperty(globalThis, "WebAssembly");
    CHECK(jsvm::IsObject(WebAssembly));
    auto WebAssemblyInstance = jsvm::GetProperty(WebAssembly, "Instance");
    CHECK(jsvm::IsFunction(WebAssemblyInstance));
    JSVM_Value wasmInstance;
    JSVM_Value argv[] = {wasmModule, importedObject};
    size_t args = 2;
    JSVM_CALL(OH_JSVM_NewInstance(jsvm_env, WebAssemblyInstance, args, argv, &wasmInstance));
    CHECK(IsWebAssemblyInstance(wasmInstance));
    return wasmInstance;
}

bool OutputStream(const char *data, int size, void *streamData)
{
    std::string value(data, size);
    *(std::string *)streamData = std::string(data, size);
    return true;
}

void TestCategory(JSVM_TraceCategory category, void (*func)())
{
    JSVM_Status status;
    std::string data;
    {
        status = OH_JSVM_TraceStart(1, &category, "trace", 0);
        CHECK(status == JSVM_OK);

        func();
        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);

        JSVM_Value obj;
        JSVM_CALL(OH_JSVM_JsonParse(jsvm_env, jsvm::Str(data), &obj));
        CHECK(jsvm::IsObject(obj));
        JSVM_Value trace = jsvm::GetProperty(obj, "trace");
        CHECK(jsvm::IsArray(trace));
        CHECK(jsvm::ArrayLength(trace) != 0);
    }
}

#define TEST_TRACE_CATEGROY(category, func) \
    TEST(Trace_##category)                  \
    {                                       \
        TestCategory(category, func);       \
    }

void RunCycle()
{
    const char *cycle = R"JS(
      function map(x, y) {
        return {"a": x, "b": y};
      }
      for (var i = 0; i < 80000; ++i) {
        var x = map(i, i);
      }
    )JS";
    jsvm::Run(cycle);
}

static JSVM_Value Empty(JSVM_Env env, JSVM_CallbackInfo info)
{
    return jsvm::Undefined();
}

void RunFunction()
{
    JSVM_Value func;
    JSVM_Status status;
    JSVM_CallbackStruct callback = {.callback = Empty, .data = nullptr};
    status = OH_JSVM_CreateFunction(jsvm_env, "func", JSVM_AUTO_LENGTH, &callback, &func);
    CHECK(status == JSVM_OK);
    JSVM_Value result;
    status = OH_JSVM_CallFunction(jsvm_env, jsvm::Undefined(), func, 0, nullptr, &result);
    CHECK(status == JSVM_OK);
}

void RunStackTrace()
{
    // run unimplemented func to do stack trace.
    JSVM_Value result;
    JSVM_Status status = OH_JSVM_RunScript(jsvm_env, jsvm::Compile("func();"), &result);
    CHECK(status == JSVM_GENERIC_FAILURE);
    JSVM_Value exception;
    status = OH_JSVM_GetAndClearLastException(jsvm_env, &exception);
    CHECK(status == JSVM_OK);
}

void RunWasm()
{
    std::vector<uint8_t> buffer;
    ReadBinaryFile(wasmPath + "add.wasm", buffer);
    CHECK(buffer.size() > 0);
    JSVM_Value wasmModule;
    JSVM_CALL(OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), NULL, 0, NULL, &wasmModule));
    CHECK(IsWasmModuleObject(wasmModule));
    JSVM_Value wasmInstance = InstantiateWasmModule(wasmModule, jsvm::Run(""));
    JSVM_Value exports = jsvm::GetProperty(wasmInstance, jsvm::Str("exports"));
    CHECK(jsvm::IsObject(exports));
    JSVM_Value add = jsvm::GetProperty(exports, jsvm::Str("add"));
    CHECK(jsvm::IsFunction(add));
    const uint32_t len = 1000;
    for (uint32_t i = 0; i < len; ++i) {
        jsvm::Call(add, jsvm::Undefined(), {jsvm::Run("1"), jsvm::Run("2")});
    }
}

TEST_TRACE_CATEGROY(JSVM_TRACE_VM, RunCycle);
TEST_TRACE_CATEGROY(JSVM_TRACE_COMPILE, RunCycle);
TEST_TRACE_CATEGROY(JSVM_TRACE_EXECUTE, RunCycle);
TEST_TRACE_CATEGROY(JSVM_TRACE_RUNTIME, RunFunction);
TEST_TRACE_CATEGROY(JSVM_TRACE_STACK_TRACE, RunStackTrace);
#if !defined(JSVM_JITLESS)
TEST_TRACE_CATEGROY(JSVM_TRACE_WASM, RunWasm);
TEST_TRACE_CATEGROY(JSVM_TRACE_WASM_DETAILED, RunWasm);
#endif

TEST(Trace_MultiCategory)
{
    std::vector<JSVM_TraceCategory> categories = {
        JSVM_TRACE_VM,          JSVM_TRACE_COMPILE, JSVM_TRACE_EXECUTE,       JSVM_TRACE_RUNTIME,
        JSVM_TRACE_STACK_TRACE, JSVM_TRACE_WASM,    JSVM_TRACE_WASM_DETAILED,
    };
    JSVM_Status status;
    std::string data;
    {
        status = OH_JSVM_TraceStart(categories.size(), categories.data(), "all", 0);
        CHECK(status == JSVM_OK);

        RunCycle();
#if !defined(JSVM_JITLESS)
        RunWasm();
#endif
        RunStackTrace();
        RunFunction();

        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);

        JSVM_Value obj;
        JSVM_CALL(OH_JSVM_JsonParse(env, jsvm::Str(data), &obj));
        CHECK(jsvm::IsObject(obj));
        JSVM_Value trace = jsvm::GetProperty(obj, "all");
        CHECK(jsvm::IsArray(trace));
        CHECK(jsvm::ArrayLength(trace) != 0);
    }
}

TEST(Trace_DefaultCategory)
{
    JSVM_Status status;
    std::string data;
    {
        status = OH_JSVM_TraceStart(0, nullptr, "default", 0);
        CHECK(status == JSVM_OK);

        RunCycle();

        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);

        JSVM_Value obj;
        JSVM_CALL(OH_JSVM_JsonParse(env, jsvm::Str(data), &obj));
        CHECK(jsvm::IsObject(obj));
        JSVM_Value trace = jsvm::GetProperty(obj, "default");
        CHECK(jsvm::IsArray(trace));
        CHECK(jsvm::ArrayLength(trace) != 0);
    }
}

TEST(Trace_MultiStart)
{
    JSVM_Status status;
    std::string data;
    {
        {
            std::vector<JSVM_TraceCategory> category = {JSVM_TRACE_VM};
            status = OH_JSVM_TraceStart(category.size(), category.data(), "start first", 0);
            CHECK(status == JSVM_OK);
        }
        {
            std::vector<JSVM_TraceCategory> category = {JSVM_TRACE_WASM};
            status = OH_JSVM_TraceStart(category.size(), category.data(), "start second", 0);
            CHECK(status == JSVM_OK);
        }
        RunCycle();

        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);

        JSVM_Value obj;
        JSVM_CALL(OH_JSVM_JsonParse(env, jsvm::Str(data), &obj));
        CHECK(jsvm::IsObject(obj));
        JSVM_Value trace = jsvm::GetProperty(obj, "start second");
        CHECK(jsvm::IsArray(trace));
        CHECK(jsvm::ArrayLength(trace) == 0);
    }
    {
        {
            std::vector<JSVM_TraceCategory> category = {JSVM_TRACE_WASM};
            status = OH_JSVM_TraceStart(category.size(), category.data(), "start first", 0);
            CHECK(status == JSVM_OK);
        }
        {
            std::vector<JSVM_TraceCategory> category = {JSVM_TRACE_VM};
            status = OH_JSVM_TraceStart(category.size(), category.data(), "start second", 0);
            CHECK(status == JSVM_OK);
        }
        RunCycle();

        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);

        JSVM_Value obj;
        JSVM_CALL(OH_JSVM_JsonParse(env, jsvm::Str(data), &obj));
        CHECK(jsvm::IsObject(obj));
        JSVM_Value trace = jsvm::GetProperty(obj, "start second");
        CHECK(jsvm::IsArray(trace));
        CHECK(jsvm::ArrayLength(trace) != 0);
    }
}

TEST(Trace_MaxTrunks)
{
    std::vector<JSVM_TraceCategory> category = {JSVM_TRACE_STACK_TRACE};
    JSVM_Status status;
    std::string data;
    {
        status = OH_JSVM_TraceStart(category.size(), category.data(), "default trunk", 0);
        CHECK(status == JSVM_OK);

        for (size_t i = 0; i < 100; ++i) {
            RunStackTrace();
        }
        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);

        JSVM_Value obj;
        JSVM_CALL(OH_JSVM_JsonParse(env, jsvm::Str(data), &obj));
        CHECK(jsvm::IsObject(obj));
        JSVM_Value trace = jsvm::GetProperty(obj, "default trunk");
        CHECK(jsvm::IsArray(trace));
        CHECK(jsvm::ArrayLength(trace) != 0);
        CHECK(jsvm::ArrayLength(trace) > 64);
    }

    {  // test maxChunks
        status = OH_JSVM_TraceStart(category.size(), category.data(), "one trunk", 1);
        CHECK(status == JSVM_OK);

        // one chunk has 64 trace events object, so we should generate over 64 trace events here.

        for (size_t i = 0; i < 100; ++i) {
            RunStackTrace();
        }
        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);

        JSVM_Value obj;
        JSVM_CALL(OH_JSVM_JsonParse(env, jsvm::Str(data), &obj));
        CHECK(jsvm::IsObject(obj));
        JSVM_Value trace = jsvm::GetProperty(obj, "one trunk");
        CHECK(jsvm::IsArray(trace));
        CHECK(jsvm::ArrayLength(trace) != 0);

        // one chunk has 64 trace events object, so length is not more than 64.
        CHECK(jsvm::ArrayLength(trace) <= 64);
    }
}

TEST(Trace_InvalidArg)
{
    JSVM_Status status;
    std::string data;

    {  // test trace without trace start
        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_INVALID_ARG);
    }

    {  // test trace with invalid category
        std::vector<JSVM_TraceCategory> category(1);
        *(int *)&category[0] = 100;
        status = OH_JSVM_TraceStart(category.size(), category.data(), "invalid", 0);
        CHECK(status == JSVM_INVALID_ARG);
    }

    {  // test trace with count or category is invalid
        std::vector<JSVM_TraceCategory> category = {JSVM_TRACE_WASM};
        status = OH_JSVM_TraceStart(0, category.data(), "invalid", 0);
        CHECK(status == JSVM_INVALID_ARG);

        status = OH_JSVM_TraceStart(1, nullptr, "invalid", 0);
        CHECK(status == JSVM_INVALID_ARG);
    }

    {  // test trace with nullptr
        std::vector<JSVM_TraceCategory> category = {JSVM_TRACE_WASM};
        status = OH_JSVM_TraceStart(category.size(), category.data(), nullptr, 0);
        CHECK(status == JSVM_OK);

        status = OH_JSVM_TraceStop(nullptr, (void *)&data);
        CHECK(status == JSVM_INVALID_ARG);

        status = OH_JSVM_TraceStop(OutputStream, nullptr);
        CHECK(status == JSVM_INVALID_ARG);

        status = OH_JSVM_TraceStop(OutputStream, (void *)&data);
        CHECK(status == JSVM_OK);
    }
}

#endif  // TEST_TRACE