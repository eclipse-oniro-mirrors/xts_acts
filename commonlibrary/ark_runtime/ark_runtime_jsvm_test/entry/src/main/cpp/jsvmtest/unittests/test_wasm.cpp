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
#ifdef TEST_WASM
#include <fstream>
#include <iostream>

#if defined(OHOS_JSVMTEST_XTS)
#define USE_HEADER_WASM
#endif

#include "jsvmtest.h"
#include "securec.h"
#ifdef USE_HEADER_WASM
#include <unordered_map>

#include "add.wasm.def"
#include "ammo.wasm.def"
#include "bfs.wasm.def"
#include "cJSON.wasm.def"
#include "global.wasm.def"
#include "illegal.wasm.def"
#include "illegal2.wasm.def"
#include "imports.wasm.def"
#include "laya.physics3D.wasm.def"
#include "math.wasm.def"
#include "memory.wasm.def"
#include "newton.wasm.def"
#include "reloc_info.wasm.def"
#include "simple.wasm.def"
#include "table.wasm.def"
#include "table2.wasm.def"
#endif

#if defined(USE_HEADER_WASM)
static const std::string wasmPath = "";

using WasmMap = std::unordered_map<std::string, std::pair<unsigned char *, unsigned int>>;
const WasmMap &InitWasmMap()
{
    static WasmMap wasmMap{};
    if (wasmMap.size() == 0) {
        wasmMap["add.wasm"] = std::pair<unsigned char *, unsigned int>(add_wasm, add_wasm_len);
        wasmMap["ammo.wasm.wasm"] = std::pair<unsigned char *, unsigned int>(ammo_wasm_wasm, ammo_wasm_wasm_len);
        wasmMap["bfs.wasm"] = std::pair<unsigned char *, unsigned int>(bfs_wasm, bfs_wasm_len);
        wasmMap["cJSON.wasm"] = std::pair<unsigned char *, unsigned int>(cJSON_wasm, cJSON_wasm_len);
        wasmMap["global.wasm"] = std::pair<unsigned char *, unsigned int>(global_wasm, global_wasm_len);
        wasmMap["illegal2.wasm"] = std::pair<unsigned char *, unsigned int>(illegal2_wasm, illegal2_wasm_len);
        wasmMap["illegal.wasm"] = std::pair<unsigned char *, unsigned int>(illegal_wasm, illegal_wasm_len);
        wasmMap["imports.wasm"] = std::pair<unsigned char *, unsigned int>(imports_wasm, imports_wasm_len);
        wasmMap["laya.physics3D.wasm.wasm"] =
            std::pair<unsigned char *, unsigned int>(laya_physics3D_wasm_wasm, laya_physics3D_wasm_wasm_len);
        wasmMap["math.wasm"] = std::pair<unsigned char *, unsigned int>(math_wasm, math_wasm_len);
        wasmMap["memory.wasm"] = std::pair<unsigned char *, unsigned int>(memory_wasm, memory_wasm_len);
        wasmMap["newton.wasm"] = std::pair<unsigned char *, unsigned int>(newton_wasm, newton_wasm_len);
        wasmMap["reloc_info.wasm"] = std::pair<unsigned char *, unsigned int>(reloc_info_wasm, reloc_info_wasm_len);
        wasmMap["simple.wasm"] = std::pair<unsigned char *, unsigned int>(simple_wasm, simple_wasm_len);
        wasmMap["table2.wasm"] = std::pair<unsigned char *, unsigned int>(table2_wasm, table2_wasm_len);
        wasmMap["table.wasm"] = std::pair<unsigned char *, unsigned int>(table_wasm, table_wasm_len);
    }
    return wasmMap;
}

#elif defined(OHOS_JSVM_HAP)
static const std::string wasmPath = "/data/storage/el1/base/wasm/";
#else
static const std::string wasmPath = "./unittests/wasm/";
#endif

static JSVM_Value GetInstanceExports(JSVM_Value wasmInstance)
{
    CHECK(jsvm::IsWebAssemblyInstance(wasmInstance));
    auto exports = jsvm::GetProperty(wasmInstance, "exports");
    CHECK(jsvm::IsObject(exports));
    return exports;
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

static void WriteBinaryFile(const char *path, const uint8_t *data, size_t byteLength)
{
    std::ofstream outfile(path, std::ofstream::binary);
    outfile.write(reinterpret_cast<const char *>(data), byteLength);
}

static void ReadTextFile(const char *path, std::string &content)
{
    std::ifstream infile(path);
    CHECK_FATAL(infile.good(), "can not access file: %s\n", path);
    std::ostringstream oss;
    oss << infile.rdbuf();
    content = oss.str();
}

[[maybe_unused]] static void ReadTextFile(const std::string &path, std::string &content)
{
    ReadTextFile(path.c_str(), content);
}

static JSVM_Value CompileWasmModule(const char *path)
{
    std::vector<uint8_t> buffer;
    ReadBinaryFile(path, buffer);
    CHECK(buffer.size() > 0);
    JSVM_Value wasmModule;
    JSVMTEST_CALL(OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), NULL, 0, NULL, &wasmModule));
    CHECK(jsvm::IsWasmModuleObject(wasmModule));
    return wasmModule;
}

static JSVM_Value CompileWasmModule(const std::string &path)
{
    return CompileWasmModule(path.c_str());
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
    constexpr size_t argc = 2;
    JSVMTEST_CALL(OH_JSVM_NewInstance(jsvm_env, WebAssemblyInstance, argc, argv, &wasmInstance));
    CHECK(jsvm::IsWebAssemblyInstance(wasmInstance));
    return wasmInstance;
}

// [begin, end)
static void BatchCompileWasmFunctions(JSVM_Value wasmModule, size_t begin, size_t end)
{
    CHECK(jsvm::IsWasmModuleObject(wasmModule));
    for (size_t i = begin; i < end; ++i) {
        JSVM_WasmOptLevel level = (i % 2 == 0 ? JSVM_WASM_OPT_BASELINE : JSVM_WASM_OPT_HIGH);
        JSVMTEST_CALL(OH_JSVM_CompileWasmFunction(jsvm_env, wasmModule, i, level));
    }
}

// 验证 wasm instance 功能 (add 模块)
static void VerifyAddWasmInstance(JSVM_Value instance)
{
    CHECK(jsvm::IsWebAssemblyInstance(instance));
    // 实例化之后，就能使用 WebAssembly module 定义的函数了
    auto exports = jsvm::GetProperty(instance, jsvm::Str("exports"));
    CHECK(jsvm::IsObject(exports));
    auto add = jsvm::GetProperty(exports, jsvm::Str("add"));
    CHECK(jsvm::IsFunction(add));
    auto result = jsvm::Call(add, jsvm::Undefined(), {jsvm::Run("1"), jsvm::Run("2")});
    CHECK(jsvm::IsNumber(result));
    constexpr int kExpectedResult = 3;
    CHECK(jsvm::ToNumber(result) == kExpectedResult);
}

static void WebAssemblyDemo()
{
    std::string path = wasmPath + "add.wasm";
    std::vector<uint8_t> buffer;
    // 从文件中读取 wasm 字节码
    ReadBinaryFile(path, buffer);
    JSVM_Status status = JSVM_OK;

    JSVM_Value wasmModule;
    // 将 wasm 字节码编译为 WebAssembly module
    status = OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), NULL, 0, NULL, &wasmModule);
    CHECK(status == JSVM_OK);

    bool isWasmModule;
    // 检查编译结果确实是一个 WebAssembly module
    status = OH_JSVM_IsWasmModuleObject(jsvm_env, wasmModule, &isWasmModule);
    CHECK(status == JSVM_OK);
    CHECK(isWasmModule);

    // 对 WebAssembly module 指定编号的函数进行 high optimization level 优化
    status = OH_JSVM_CompileWasmFunction(jsvm_env, wasmModule, 0, JSVM_WASM_OPT_HIGH);
    CHECK(status == JSVM_OK);

    // 实例化 WebAssembly module
    auto instance = InstantiateWasmModule(wasmModule, jsvm::Run("{}"));
    VerifyAddWasmInstance(instance);

    // 对编译后的 WebAssembly moudle 进行序列化，创建 wasm cache
    const uint8_t *cacheData = NULL;
    size_t cacheLength = 0;
    status = OH_JSVM_CreateWasmCache(jsvm_env, wasmModule, &cacheData, &cacheLength);
    CHECK(status == JSVM_OK);
    CHECK(cacheData != NULL);
    CHECK(cacheLength > 0);

    // 对序列化得到的 cache data 进行持久化存储
    const std::string wasmCachePath = path + ".cache";
    WriteBinaryFile(wasmCachePath.c_str(), cacheData, cacheLength);
    status = OH_JSVM_ReleaseCache(jsvm_env, cacheData, JSVM_CACHE_TYPE_WASM);
    CHECK(status == JSVM_OK);

    // 下次使用时，直接使用 wasm cache 反序列化得到 WebAssembly module，避免编译开销
    std::vector<uint8_t> cacheBuffer;
    ReadBinaryFile(wasmCachePath, cacheBuffer);
    CHECK(cacheBuffer.size() == cacheLength);

    bool cacheRejected;
    JSVM_Value wasmModuleSerialized;
    status = OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), cacheBuffer.data(), cacheBuffer.size(),
                                       &cacheRejected, &wasmModuleSerialized);
    CHECK(status == JSVM_OK);

    CHECK(cacheRejected == false);
    status = OH_JSVM_IsWasmModuleObject(jsvm_env, wasmModuleSerialized, &isWasmModule);
    CHECK(status == JSVM_OK);
    CHECK(isWasmModule);

    // 测试反序列化而来的 WebAssembly module 的功能
    // 实例化 WebAssembly module
    auto instance2 = InstantiateWasmModule(wasmModuleSerialized, jsvm::Run("var x = {}; x"));
    VerifyAddWasmInstance(instance2);
}

#if !defined(JSVM_JITLESS)
// test for Wasm Is Wasm Module Object
TEST(Wasm_IsWasmModuleObject)
{
    auto number = jsvm::Run("42");
    CHECK(!jsvm::IsWasmModuleObject(number));
    CHECK(!jsvm::IsWasmModuleObject(jsvm::Undefined()));
    CHECK(!jsvm::IsWasmModuleObject(jsvm::Null()));
    CHECK(!jsvm::IsWasmModuleObject(jsvm::Str("hello")));
}

#ifdef OHOS_JSVMTEST_XTS
TEST_DISABLE(Wasm_WebAssemblyDemo)
{
#else
TEST(Wasm_WebAssemblyDemo)
{
#endif
    WebAssemblyDemo();
}

// test for Wasm Compile Wasm Module
TEST(Wasm_CompileWasmModule)
{
    JSVM_Value wasmModule = CompileWasmModule(wasmPath + "add.wasm");
    JSVM_Value wasmInstance = InstantiateWasmModule(wasmModule, jsvm::Run("{}"));
    JSVM_Value exports = jsvm::GetProperty(wasmInstance, jsvm::Str("exports"));
    CHECK(jsvm::IsObject(exports));
    JSVM_Value addFunc = jsvm::GetProperty(exports, jsvm::Str("add"));
    CHECK(jsvm::IsFunction(addFunc));
    JSVM_Value one = jsvm::Run("1");
    JSVM_Value two = jsvm::Run("2");
    JSVM_Value result = jsvm::Call(addFunc, jsvm::Undefined(), {one, two});
    CHECK(jsvm::ToNumber(result) == 3);

    JSVMTEST_CALL(OH_JSVM_CompileWasmFunction(env, wasmModule, 0, JSVM_WASM_OPT_HIGH));

    const uint8_t *cacheData = nullptr;
    size_t cacheSize = 0;
    JSVMTEST_CALL(OH_JSVM_CreateWasmCache(env, wasmModule, &cacheData, &cacheSize));
    CHECK(cacheData != nullptr);
    CHECK(cacheSize > 0);
}

[[maybe_unused]] static void RandomDeserialize(JSVM_Env env, const std::string &filename)
{
    std::string wasmFile = wasmPath + filename;
    std::string cacheFile = wasmPath + filename + ".test.cache";
    std::ifstream infile(cacheFile);
    if (!infile.good()) {
        // CreateCodeCache
        auto wasmModule = CompileWasmModule(wasmFile);
        InstantiateWasmModule(wasmModule, jsvm::Undefined());
        JSVMTEST_CALL(OH_JSVM_CompileWasmFunction(env, wasmModule, 0, JSVM_WASM_OPT_HIGH));
        const uint8_t *data = NULL;
        size_t length = 0;
        JSVMTEST_CALL(OH_JSVM_CreateWasmCache(env, wasmModule, &data, &length));
        CHECK(data != NULL);
        CHECK(length > 0);
        WriteBinaryFile(cacheFile.c_str(), data, length);
        JSVMTEST_CALL(OH_JSVM_ReleaseCache(env, data, JSVM_CACHE_TYPE_WASM));
    } else {
        std::vector<uint8_t> buffer;
        ReadBinaryFile(wasmFile, buffer);
        std::vector<uint8_t> cache;
        ReadBinaryFile(cacheFile, cache);
        JSVM_Value wasmModule;
        bool cacheRejected;
        JSVMTEST_CALL(OH_JSVM_CompileWasmModule(env, buffer.data(), buffer.size(), cache.data(), cache.size(),
                                                &cacheRejected, &wasmModule));
        CHECK(cacheRejected == false);
        CHECK(jsvm::IsWasmModuleObject(wasmModule));
        // 运行一定次数后，删除缓存
        constexpr int kPeriodToRemoveCache = 3;
        static int cnt = 0;
        if (++cnt % kPeriodToRemoveCache == 0) {
            int result = remove(cacheFile.c_str());
            CHECK(result == 0);
        }
    }
}

// test for Wasm Random Cache Test
#ifdef OHOS_JSVMTEST_XTS
TEST_DISABLE(Wasm_RandomCacheTest)
{
#else
TEST(Wasm_RandomCacheTest)
{
#endif
    static std::vector<std::string> allFiles = {
        "add.wasm",
        "bfs.wasm",
        "cJSON.wasm",
        "math.wasm",
    };
    for (const std::string &filename : allFiles) {
        for (int i = 0; i < 100; ++i) {
            RandomDeserialize(env, filename);
        }
    }
}

// test for Wasm Compile Wasm Function Baseline
TEST(Wasm_CompileWasmFunctionBaseline)
{
    auto wasmModule = CompileWasmModule(wasmPath + "add.wasm");
    InstantiateWasmModule(wasmModule, jsvm::Undefined());
    JSVMTEST_CALL(OH_JSVM_CompileWasmFunction(env, wasmModule, 0, JSVM_WASM_OPT_BASELINE));
    JSVMTEST_CALL(OH_JSVM_CompileWasmFunction(env, wasmModule, 0, JSVM_WASM_OPT_HIGH));
    auto status = OH_JSVM_CompileWasmFunction(env, wasmModule, 1, JSVM_WASM_OPT_HIGH);
    CHECK(status != JSVM_OK);
}

// test for Wasm Compile Illegal Wasm Module
TEST(Wasm_CompileIllegalWasmModule)
{
    std::vector<uint8_t> buffer;
    std::vector<std::string> pathVec = {
        wasmPath + "illegal.wasm",
        wasmPath + "illegal2.wasm",
    };
    for (const std::string &path : pathVec) {
        ReadBinaryFile(path, buffer);
        CHECK(buffer.size() > 0);
        JSVM_Value wasmModule;
        JSVM_Status status =
            OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), NULL, 0, NULL, &wasmModule);
        CHECK(status == JSVM_PENDING_EXCEPTION);
    }
}

// Test import global
static void TestImportGlobal(JSVM_Env env, JSVM_Value exports)
{
    JSVM_Value testFunc;
    JSVM_Value result;
    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_global_i32"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {});
    CHECK(jsvm::Equals(result, jsvm::Run("100")));

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_global_i64"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {});
    CHECK(jsvm::Equals(result, jsvm::Run("1000000000000000n")));

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_global_f32"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {});

    JSVM_ValueType type;
    OH_JSVM_Typeof(env, result, &type);
    CHECK(jsvm::Equals(result, jsvm::Run("new Float32Array([1.3])[0]")));

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_global_f64"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {});
    CHECK(jsvm::Equals(result, jsvm::Run("2.7")));
}

// Test import func
static void TestImportFunc(JSVM_Env env, JSVM_Value exports)
{
    (void)env;
    JSVM_Value testFunc;
    JSVM_Value result;
    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_sub"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {jsvm::Run("1"), jsvm::Run("2")});
    CHECK(jsvm::Equals(result, jsvm::Run("-1")));
}

// Test import memory
static void TestImportMemory(JSVM_Env env, JSVM_Value exports)
{
    JSVM_Value testFunc;
    JSVM_Value result;
    JSVM_Status status = JSVM_OK;
    JSVM_Value exception;
    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_memory"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {jsvm::Run("0")});
    CHECK(jsvm::Equals(result, jsvm::Run("0")));

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_memory"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {jsvm::Run("10")});
    CHECK(jsvm::Equals(result, jsvm::Run("16")));

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_memory"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {jsvm::Run("8")});
    CHECK(jsvm::Equals(result, jsvm::Run("1048576")));

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_memory"));
    JSVM_Value argv[1] = {jsvm::Run("1000000")};
    status = OH_JSVM_CallFunction(jsvm_env, jsvm::Undefined(), testFunc, 1, argv, &result);
    CHECK(status == JSVM_PENDING_EXCEPTION);
    status = OH_JSVM_GetAndClearLastException(env, &exception);
}

// Test import table
static void TestImportTable(JSVM_Env env, JSVM_Value exports)
{
    JSVM_Value testFunc;
    JSVM_Value result;
    JSVM_Status status = JSVM_OK;
    JSVM_Value exception;
    {
        testFunc = jsvm::GetProperty(exports, jsvm::Str("test_table"));
        JSVM_Value argv[1] = {jsvm::Run("0")};
        status = OH_JSVM_CallFunction(jsvm_env, jsvm::Undefined(), testFunc, 1, argv, &result);
        CHECK(status == JSVM_PENDING_EXCEPTION);
        OH_JSVM_GetAndClearLastException(env, &exception);
    }

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_table"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {jsvm::Run("1")});
    CHECK(jsvm::Equals(result, jsvm::Run("11")));

    testFunc = jsvm::GetProperty(exports, jsvm::Str("test_table"));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {jsvm::Run("2")});
    CHECK(jsvm::Equals(result, jsvm::Run("22")));

    {
        testFunc = jsvm::GetProperty(exports, jsvm::Str("test_table"));
        JSVM_Value argv[1] = {jsvm::Run("3")};
        status = OH_JSVM_CallFunction(jsvm_env, jsvm::Undefined(), testFunc, 1, argv, &result);
        CHECK(status == JSVM_PENDING_EXCEPTION);
        OH_JSVM_GetAndClearLastException(env, &exception);
    }

    {
        testFunc = jsvm::GetProperty(exports, jsvm::Str("test_table"));
        JSVM_Value argv[1] = {jsvm::Run("100")};
        status = OH_JSVM_CallFunction(jsvm_env, jsvm::Undefined(), testFunc, 1, argv, &result);
        CHECK(status == JSVM_PENDING_EXCEPTION);
        OH_JSVM_GetAndClearLastException(env, &exception);
    }
}

// test for Wasm Compile Wasm Module With Imports
TEST(Wasm_CompileWasmModuleWithImports)
{
    JSVM_Value wasmModule = CompileWasmModule(wasmPath + "imports.wasm");
    const char *importJs = R"JS(
        var x = {
            test: {
                global_i32: 100,
                global_i64: 1000000000000000n,
                global_f32: 1.3,
                global_f64: 2.7,
                sub: (a, b) => { return a - b; },
                memory: new WebAssembly.Memory({initial: 1, maximum: 2}),
                table: new WebAssembly.Table({initial: 10, maximum: 20, element: 'anyfunc'}),
            }
        };
        x
    )JS";

    JSVM_Value importedObj = jsvm::Run(importJs);

    CHECK(jsvm::IsObject(importedObj));
    JSVM_Value wasmInstance = InstantiateWasmModule(wasmModule, importedObj);
    JSVM_Value exports = jsvm::GetProperty(wasmInstance, jsvm::Str("exports"));
    CHECK(jsvm::IsObject(exports));

    TestImportGlobal(env, exports);
    TestImportFunc(env, exports);
    TestImportMemory(env, exports);
    TestImportTable(env, exports);
}

static void CompileWasmFunctions(JSVM_Env env, JSVM_Value wasmModule,
                                 const std::initializer_list<uint32_t> &funcIndexList, JSVM_WasmOptLevel optLevel)
{
    for (uint32_t funcIndex : funcIndexList) {
        JSVM_Status status = OH_JSVM_CompileWasmFunction(jsvm_env, wasmModule, funcIndex, optLevel);
        CHECK(status == JSVM_OK);
    }
}

static JSVM_Value TestCacheAndRelocInfoStep1(JSVM_Env env, const std::vector<uint8_t> &buffer,
                                             const uint8_t *&cacheData, size_t &cacheSize)
{
    JSVM_Value wasmModule;
    JSVMTEST_CALL(OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), NULL, 0, NULL, &wasmModule));
    CHECK(jsvm::IsWasmModuleObject(wasmModule));

    JSVM_Value wasmInstance =
        InstantiateWasmModule(wasmModule, jsvm::Run("var x = { test: {func: () => { return 1; }}}; x"));
    JSVM_Value exports = jsvm::GetProperty(wasmInstance, jsvm::Str("exports"));
    CHECK(jsvm::IsObject(exports));

    CompileWasmFunctions(env, wasmModule, {1, 2}, JSVM_WASM_OPT_HIGH);

    JSVM_Value testFunc;
    JSVM_Value result;
    {
        testFunc = jsvm::GetProperty(exports, jsvm::Str("test_wasm_call_reloc_info"));
        CHECK(jsvm::IsFunction(testFunc));
        result = jsvm::Call(testFunc, jsvm::Undefined(), {});
        CHECK(jsvm::Equals(result, jsvm::Run("1")));

        testFunc = jsvm::GetProperty(exports, jsvm::Str("test_wasm_stub_call_reloc_info"));
        CHECK(jsvm::IsFunction(testFunc));
        result = jsvm::Call(testFunc, jsvm::Undefined(), {});
        CHECK(jsvm::Equals(result, jsvm::Run("1")));
    }
    JSVMTEST_CALL(OH_JSVM_CreateWasmCache(env, wasmModule, &cacheData, &cacheSize));
    CHECK(cacheData != nullptr);
    CHECK(cacheSize > 0);
    return exports;
}

static void TestCacheAndRelocInfoStep2(JSVM_Env env, const std::vector<uint8_t> &buffer, const uint8_t *cacheData,
                                       size_t cacheSize, JSVM_Value exports)
{
    bool cacheRejected;
    JSVM_Value wasmModule;
    JSVM_Status status = OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), cacheData, cacheSize,
                                                   &cacheRejected, &wasmModule);
    CHECK(status == JSVM_OK);
    CHECK(cacheRejected == false);

    JSVM_Value wasmInstance =
        InstantiateWasmModule(wasmModule, jsvm::Run("var x = { test: {func: () => { return 2; }}}; x"));

    JSVM_Value newExports = jsvm::GetProperty(wasmInstance, jsvm::Str("exports"));
    JSVM_Value testFunc;
    JSVM_Value result;

    {
        testFunc = jsvm::GetProperty(newExports, jsvm::Str("test_wasm_call_reloc_info"));
        CHECK(jsvm::IsFunction(testFunc));
        result = jsvm::Call(testFunc, jsvm::Undefined(), {});
        CHECK(jsvm::Equals(result, jsvm::Run("1")));

        testFunc = jsvm::GetProperty(newExports, jsvm::Str("test_wasm_stub_call_reloc_info"));
        CHECK(jsvm::IsFunction(testFunc));
        result = jsvm::Call(testFunc, jsvm::Undefined(), {});
        CHECK(jsvm::Equals(result, jsvm::Run("1")));
    }

    testFunc = jsvm::GetProperty(exports, jsvm::Str("call_import"));
    CHECK(jsvm::IsFunction(testFunc));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {});
    CHECK(jsvm::Equals(result, jsvm::Run("1")));

    testFunc = jsvm::GetProperty(newExports, jsvm::Str("call_import"));
    CHECK(jsvm::IsFunction(testFunc));
    result = jsvm::Call(testFunc, jsvm::Undefined(), {});
    CHECK(jsvm::Equals(result, jsvm::Run("2")));

    CompileWasmFunctions(env, wasmModule, {1, 2}, JSVM_WASM_OPT_HIGH);
    CompileWasmFunctions(env, wasmModule, {1, 2}, JSVM_WASM_OPT_HIGH);

    status = OH_JSVM_ReleaseCache(jsvm_env, cacheData, JSVM_CACHE_TYPE_WASM);
    CHECK(status == JSVM_OK);
}

// test for Wasm Compile Wasm Module With Cache And Reloc Info
TEST(Wasm_CompileWasmModuleWithCacheAndRelocInfo)
{
    std::vector<uint8_t> buffer;
    ReadBinaryFile(wasmPath + "reloc_info.wasm", buffer);
    CHECK(buffer.size() > 0);

    const uint8_t *cacheData = NULL;
    size_t cacheSize = 0;
    JSVM_Value exports = TestCacheAndRelocInfoStep1(env, buffer, cacheData, cacheSize);
    TestCacheAndRelocInfoStep2(env, buffer, cacheData, cacheSize, exports);
}

// test for Wasm Multiple Instances
TEST(Wasm_MultipleInstances)
{
    auto wasmModule = CompileWasmModule(wasmPath + "add.wasm");
    {
        auto obj = jsvm::Run("var x = { foo : 'bar' }; x");
        CHECK(jsvm::IsObject(obj));
        auto instance = InstantiateWasmModule(wasmModule, obj);
        CHECK(jsvm::IsWebAssemblyInstance(instance));
    }
    {
        auto obj = jsvm::Run("var x = { a : 1 }; x");
        CHECK(jsvm::IsObject(obj));
        auto instance = InstantiateWasmModule(wasmModule, obj);
        CHECK(jsvm::IsWebAssemblyInstance(instance));
    }
    {
        auto obj = jsvm::Run("var x = { b : 2 }; x");
        CHECK(jsvm::IsObject(obj));
        auto instance = InstantiateWasmModule(wasmModule, obj);
        CHECK(jsvm::IsWebAssemblyInstance(instance));
    }
}

static std::string fakelog = "";

static JSVM_Value FakeConsoleLog(JSVM_Env env, JSVM_CallbackInfo info)
{
    size_t argc = 1;
    JSVM_Value argv[1];
    JSVMTEST_CALL(OH_JSVM_GetCbInfo(env, info, &argc, argv, NULL, NULL));
    JSVM_Value x = argv[0];
    fakelog = jsvm::ToString(x);
    return jsvm::Undefined();
}

static void InstallFakeConsoleLog(JSVM_Env env)
{
    static JSVM_CallbackStruct cb = {FakeConsoleLog, NULL};
    JSVM_Value log;
    JSVMTEST_CALL(OH_JSVM_CreateFunction(env, "log", JSVM_AUTO_LENGTH, &cb, &log));
    CHECK(jsvm::IsFunction(log));
    auto console = jsvm::Global("console");
    if (!jsvm::IsObject(console)) {
        JSVMTEST_CALL(OH_JSVM_CreateObject(env, &console));
        jsvm::SetProperty(jsvm::Global(), "console", console);
    }
    jsvm::SetProperty(console, "log", log);
}

// test for Wasm MDN index
TEST(Wasm_MDN_index)
{
    fakelog = "";
    InstallFakeConsoleLog(env);
    auto wasmModule = CompileWasmModule(wasmPath + "simple.wasm");
    auto importObj = jsvm::Run(R"JS(
        var importObject = {
            my_namespace: {
                imported_func: arg => {
                    console.log(arg);
                }
            }
        };
        importObject;
     )JS");
    CHECK(jsvm::IsObject(importObj));
    auto instance = InstantiateWasmModule(wasmModule, importObj);
    auto exports = jsvm::GetProperty(instance, jsvm::Str("exports"));
    auto exported_func = jsvm::GetProperty(exports, jsvm::Str("exported_func"));
    CHECK(fakelog == "");
    jsvm::Call(exported_func);  // expected console.log 42
    CHECK(fakelog == "42");
}

// test for Wasm MDN imports
TEST(Wasm_MDN_imports)
{
    auto wasmModule = CompileWasmModule(wasmPath + "simple.wasm");
    auto WebAssembly = jsvm::GetProperty(jsvm::Global(), jsvm::Str("WebAssembly"));
    auto Module = jsvm::GetProperty(WebAssembly, jsvm::Str("Module"));
    auto ModuleImports = jsvm::GetProperty(Module, jsvm::Str("imports"));
    CHECK(jsvm::IsFunction(ModuleImports));
    auto imports = jsvm::Call(ModuleImports, Module, {wasmModule});
    CHECK(jsvm::IsArray(imports));
    JSVM_Value element;
    JSVMTEST_CALL(OH_JSVM_GetElement(env, imports, 0, &element));
    CHECK(jsvm::IsObject(element));
}

// test for Wasm MDN validate
TEST(Wasm_MDN_validate)
{
    std::vector<uint8_t> buffer;
    ReadBinaryFile(wasmPath + "simple.wasm", buffer);
    CHECK(buffer.size() > 0);
    void *backingStoreData = NULL;
    JSVM_Value arraybuffer;
    JSVMTEST_CALL(OH_JSVM_CreateArraybuffer(env, buffer.size(), &backingStoreData, &arraybuffer));
    memcpy_s(backingStoreData, buffer.size(), buffer.data(), buffer.size());
    CHECK(jsvm::IsArraybuffer(arraybuffer));

    auto WebAssembly = jsvm::Global("WebAssembly");
    auto validate = jsvm::GetProperty(WebAssembly, "validate");
    auto isValid = jsvm::Call(validate, WebAssembly, {arraybuffer});
    CHECK(jsvm::IsBoolean(isValid));
    CHECK(jsvm::StrictEquals(isValid, jsvm::True()));
}

// test for Wasm MDN memory
TEST(Wasm_MDN_memory)
{
    (void)jsvm::Run(R"JS(
        var memory = new WebAssembly.Memory({
            initial: 10,
            maximum: 100,
        });
        memory
    )JS");
    auto x = jsvm::GetProperty(jsvm::Global(), jsvm::Str("memory"));
    CHECK(jsvm::IsObject(x));
    auto importObject = jsvm::Run(R"JS(
        var importObject = {
            js: {
                mem: memory
            }
        };
        importObject
    )JS");
    auto wasmModule = CompileWasmModule(wasmPath + "memory.wasm");
    auto instance = InstantiateWasmModule(wasmModule, importObject);

    jsvm::Run(R"JS(
        var summands = new DataView(memory.buffer);
        for (var i = 0; i < 10; ++i) {
            summands.setUint32(i * 4, i, true);  // WebAssembly is little endian
        }
    )JS");

    auto exports = GetInstanceExports(instance);
    auto accumulate = jsvm::GetProperty(exports, jsvm::Str("accumulate"));
    CHECK(jsvm::IsFunction(accumulate));
    auto result = jsvm::Call(accumulate, exports, {jsvm::Int32(0), jsvm::Int32(10)});
    CHECK(jsvm::IsNumber(result));
    CHECK(jsvm::ToNumber(result) == 45);
}

// test for Wasm MDN table
TEST(Wasm_MDN_table)
{
    auto table = jsvm::Run(R"JS(
        var table = new WebAssembly.Table({
            element: "anyfunc",
            initial: 1,
            maximum: 10
        });
        table.grow(1);
        table;
    )JS");
    CHECK(jsvm::IsWebAssemblyTable(table));
    auto wasmModule = CompileWasmModule(wasmPath + "table.wasm");
    auto instance = InstantiateWasmModule(wasmModule, jsvm::Undefined());
    auto exports = GetInstanceExports(instance);
    auto tbl = jsvm::GetProperty(exports, jsvm::Str("tbl"));
    jsvm::SetProperty(jsvm::Global(), jsvm::Str("tbl"), tbl);
    auto r0 = jsvm::Run("tbl.get(0)()");
    CHECK(jsvm::ToNumber(r0) == 13);
    auto r1 = jsvm::Run("tbl.get(1)()");
    CHECK(jsvm::ToNumber(r1) == 42);
}

// test for Wasm MDN table2
TEST(Wasm_MDN_table2)
{
    auto tbl = jsvm::Run(R"JS(
        var tbl = new WebAssembly.Table({
            initial: 2,
            element: "anyfunc"
        });
        tbl;
    )JS");
    CHECK(jsvm::IsWebAssemblyTable(tbl));

    auto importObject = jsvm::Run(R"JS(
        var importObject = {
            js: { tbl }
        };
        importObject;
    )JS");
    CHECK(jsvm::IsObject(importObject));

    auto wasmModule = CompileWasmModule(wasmPath + "table2.wasm");
    (void)InstantiateWasmModule(wasmModule, importObject);
    auto r0 = jsvm::Run("tbl.get(0)()");
    CHECK(jsvm::ToNumber(r0) == 42);
    auto r1 = jsvm::Run("tbl.get(1)()");
    CHECK(jsvm::ToNumber(r1) == 83);
}

// test for Wasm MDN global
TEST(Wasm_MDN_global)
{
    (void)jsvm::Run("var global = new WebAssembly.Global({ value: 'i32', mutable: true }, 0); global");
    auto wasmModule = CompileWasmModule(wasmPath + "global.wasm");
    auto importObject = jsvm::Run(R"JS(
        var importObject = {
            js: { global }
        };
        importObject
    )JS");
    auto instance = InstantiateWasmModule(wasmModule, importObject);
    auto exports = GetInstanceExports(instance);
    auto getGlobal = jsvm::GetProperty(exports, "getGlobal");
    CHECK(jsvm::IsFunction(getGlobal));
    auto r0 = jsvm::Call(getGlobal, exports, {});
    CHECK(jsvm::ToNumber(r0) == 0);
    jsvm::Run("global.value = 42");
    auto r1 = jsvm::Call(getGlobal, exports, {});
    CHECK(jsvm::ToNumber(r1) == 42);
    auto incGlobal = jsvm::GetProperty(exports, "incGlobal");
    jsvm::Call(incGlobal, exports, {});
    auto r2 = jsvm::Call(getGlobal, exports, {});
    CHECK(jsvm::ToNumber(r2) == 43);
}

// test for Wasm Multiple Modules
TEST(Wasm_MultipleModules)
{
    auto mathModule = CompileWasmModule(wasmPath + "math.wasm");
    auto newtonModule = CompileWasmModule(wasmPath + "newton.wasm");
    auto mathInstance = InstantiateWasmModule(mathModule, jsvm::Undefined());
    auto mathExports = GetInstanceExports(mathInstance);
    auto add = jsvm::GetProperty(mathExports, "add");
    CHECK(jsvm::IsFunction(add));
    auto sub = jsvm::GetProperty(mathExports, "sub");
    CHECK(jsvm::IsFunction(sub));
    jsvm::SetProperty(jsvm::Global(), jsvm::Str("add"), add);
    jsvm::SetProperty(jsvm::Global(), jsvm::Str("sub"), sub);
    auto mathObj = jsvm::Run(R"JS(
        var mathObj = {
            math: {
                add: add,
                sub, sub
            }
        };
        mathObj
    )JS");
    CHECK(jsvm::IsObject(mathObj));
    auto newtonInstance = InstantiateWasmModule(newtonModule, mathObj);
    auto newtonExports = GetInstanceExports(newtonInstance);
    auto calculate = jsvm::GetProperty(newtonExports, "calculate");
    CHECK(jsvm::IsFunction(calculate));
    auto result = jsvm::Call(calculate);
    CHECK(jsvm::IsNumber(result));
    CHECK(jsvm::ToNumber(result) == 42);
}

void runCToWasm(JSVM_Env env, const std::string& filePath)
{
    std::vector<uint8_t> buffer;
    ReadBinaryFile(filePath, buffer);
    CHECK(buffer.size() > 0);
    JSVM_Value wasmModule;
    JSVMTEST_CALL(OH_JSVM_CompileWasmModule(jsvm_env, buffer.data(), buffer.size(), NULL, 0, NULL, &wasmModule));
    CHECK(jsvm::IsWasmModuleObject(wasmModule));

    JSVM_Value wasmInstance =
        InstantiateWasmModule(wasmModule, jsvm::Run("var x = { test: {func: () => { return 1; }}}; x"));
    JSVM_Value exports = jsvm::GetProperty(wasmInstance, jsvm::Str("exports"));
    CHECK(jsvm::IsObject(exports));

    CompileWasmFunctions(env, wasmModule, {1, 2}, JSVM_WASM_OPT_HIGH);

    JSVM_Value testFunc;
    JSVM_Value result;
    {
        testFunc = jsvm::GetProperty(exports, jsvm::Str("_start"));
        CHECK(jsvm::IsFunction(testFunc));
        result = jsvm::Call(testFunc, jsvm::Undefined(), {});
        CHECK(jsvm::Equals(result, jsvm::Undefined()));
    }
}

// test for Wasm Run CTo Wasm Test
TEST(Wasm_RunCToWasmTest)
{
    std::vector<std::string> pathVec = {
        wasmPath + "bfs.wasm",
        wasmPath + "cJSON.wasm",
    };

    for (std::string &wasm : pathVec) {
        runCToWasm(env, wasm);
    }
}

// test for Wasm Game Engine Ammo
TEST(Wasm_GameEngineAmmo)
{
    std::string wasmFile = wasmPath + "ammo.wasm.wasm";
    auto wasmModule = CompileWasmModule(wasmFile);
    const char *str = R"JS(
        var obj = {
            f: () => {},
            c: () => {},
            d: () => {},
            e: () => {},
            b: () => {},
            g: () => {},
            a: () => {},
            memory: new WebAssembly.Memory({initial: 1024, maximum: 1024}),
            table: new WebAssembly.Table({ initial: 758, element: "anyfunc" })
        };
        var importObj = {
            env: obj,
            wasi_unstable: obj
        };
        importObj;
    )JS";
    auto importObj = jsvm::Run(str);
    auto instance = InstantiateWasmModule(wasmModule, importObj);
    CHECK(jsvm::IsWebAssemblyInstance(instance));
    BatchCompileWasmFunctions(wasmModule, 7, 20);
    BatchCompileWasmFunctions(wasmModule, 400, 420);
    BatchCompileWasmFunctions(wasmModule, 1480, 1502);
    auto exports = GetInstanceExports(instance);
    CHECK(jsvm::IsObject(exports));
}

// test for Wasm Game Engine Laya
TEST(Wasm_GameEngineLaya)
{
    std::string wasmFile = wasmPath + "laya.physics3D.wasm.wasm";
    auto wasmModule = CompileWasmModule(wasmFile);
    const char *str = R"JS(
        var importObj = {
            env: {
                memory: new WebAssembly.Memory({initial: 2}),
            },
            wasi_unstable: {
                fd_close: () => {},
                fd_write: () => {},
                fd_seek: () => {},
            },
            LayaAirInteractive: {
                getWorldTransform: () => {},
                setWorldTransform: () => {},
            }
        };
        importObj;
    )JS";
    auto importObj = jsvm::Run(str);
    auto instance = InstantiateWasmModule(wasmModule, importObj);
    CHECK(jsvm::IsWebAssemblyInstance(instance));
    BatchCompileWasmFunctions(wasmModule, 5, 20);
    BatchCompileWasmFunctions(wasmModule, 400, 420);
    BatchCompileWasmFunctions(wasmModule, 1320, 1333);
    auto exports = GetInstanceExports(instance);
    CHECK(jsvm::IsObject(exports));
}
#else
static void GetLastErrorAndClean(JSVM_Env env)
{
    JSVM_Value result = nullptr;
    OH_JSVM_GetAndClearLastException(env, &result);
}

// test for Wasm Is Wasm Module Object
TEST(Wasm_IsWasmModuleObject)
{
    auto number = jsvm::Run("42");
    CHECK(!jsvm::IsWasmModuleObject(number));
    CHECK(!jsvm::IsWasmModuleObject(jsvm::Undefined()));
    CHECK(!jsvm::IsWasmModuleObject(jsvm::Null()));
    CHECK(!jsvm::IsWasmModuleObject(jsvm::Str("hello")));
}

// test for Wasm Compile Wasm
TEST(Wasm_CompileWasmModule)
{
    uint8_t* buffer = new uint8_t[2];
    buffer[0] = 0x01;
    buffer[1] = 0x02;
    JSVM_Value wasmModule = nullptr;
    JSVM_Status status = OH_JSVM_CompileWasmModule(jsvm_env, buffer, 2, NULL, 0, NULL, &wasmModule);
    delete[] buffer;
    CHECK(status == JSVM_JIT_MODE_EXPECTED);
    GetLastErrorAndClean(jsvm_env);
}

// test for Wasm Compile Function
TEST(Wasm_CompileWasmFunction)
{
    JSVM_Value wasmModule = nullptr;
    JSVM_Status status = OH_JSVM_CompileWasmFunction(jsvm_env, wasmModule, 0, JSVM_WASM_OPT_HIGH);
    CHECK(status == JSVM_JIT_MODE_EXPECTED);
    GetLastErrorAndClean(jsvm_env);
}

// test for Wasm Create Cache
TEST(Wasm_CreateWasmCache)
{
    const uint8_t *cacheData = nullptr;
    size_t cacheSize = 0;
    JSVM_Value wasmModule = nullptr;
    JSVM_Status status = OH_JSVM_CreateWasmCache(jsvm_env, wasmModule, &cacheData, &cacheSize);
    CHECK(status == JSVM_JIT_MODE_EXPECTED);
    GetLastErrorAndClean(jsvm_env);
}

// test for Wasm Release Cache
TEST(Wasm_ReleaseWasmCache)
{
    uint8_t* cacheData = new uint8_t[2];
    cacheData[0] = 0x01;
    cacheData[1] = 0x02;
    JSVM_Status status = OH_JSVM_ReleaseCache(jsvm_env, cacheData, JSVM_CACHE_TYPE_WASM);
    CHECK(status == JSVM_OK);
}
#endif  // JSVM_JITLESS
#endif  // TEST_WASM
