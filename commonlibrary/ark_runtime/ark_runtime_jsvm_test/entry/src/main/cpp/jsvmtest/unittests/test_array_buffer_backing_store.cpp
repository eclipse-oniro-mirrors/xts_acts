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
#ifdef TEST_ARRAY_BUFFER_BACKING_STORE
#include <cstdlib>
#include <random>

#include "jsvmtest.h"

// test for Array Buffer Backing Store
TEST(ArrayBufferBackingStore)
{
    std::random_device rd;
    std::mt19937 gen(rd());
    constexpr int kMinVal = 1000;
    constexpr int kMaxVal = 2000;
    std::uniform_int_distribution<> distrib(kMinVal, kMaxVal);

    int random_number = distrib(gen);
    for (auto i = 1; i < random_number; i++) {
        void *backingStore;
        OH_JSVM_AllocateArrayBufferBackingStoreData(100, JSVM_ZERO_INITIALIZED, &backingStore);
        JSVM_Value arrayBuffer;
        JSVMTEST_CALL(OH_JSVM_CreateArrayBufferFromBackingStoreData(env, backingStore, 100, 0, 25, &arrayBuffer));
        JSVM_Value arrayBuffer1;
        JSVMTEST_CALL(OH_JSVM_CreateArrayBufferFromBackingStoreData(env, backingStore, 100, 25, 25, &arrayBuffer1));
        JSVM_Value arrayBuffer2;
        JSVMTEST_CALL(OH_JSVM_CreateArrayBufferFromBackingStoreData(env, backingStore, 100, 50, 25, &arrayBuffer2));
        JSVM_Value arrayBuffer3;
        JSVMTEST_CALL(OH_JSVM_CreateArrayBufferFromBackingStoreData(env, backingStore, 100, 75, 25, &arrayBuffer3));
        jsvm::SetProperty(jsvm::Global(), jsvm::Str("buffer"), arrayBuffer);
        jsvm::SetProperty(jsvm::Global(), jsvm::Str("buffer1"), arrayBuffer1);
        jsvm::SetProperty(jsvm::Global(), jsvm::Str("buffer2"), arrayBuffer2);
        jsvm::SetProperty(jsvm::Global(), jsvm::Str("buffer3"), arrayBuffer3);
        jsvm::Run(R"JS(
            function writeBuffer(data) {
                let view = new Uint8Array(data);
                // Write some values to the ArrayBuffer
                for (let i = 0; i < view.length; i++) {
                    view[i] = i % 256;
                }
            }
            writeBuffer(buffer);
            writeBuffer(buffer1);
            writeBuffer(buffer2);
            writeBuffer(buffer3);
        )JS");
        uint8_t *array = static_cast<uint8_t *>(backingStore);
        for (auto i = 0; i < 100; ++i) {
            CHECK(array[i] == i % 25 % 256);
        }
        JSVMTEST_CALL(OH_JSVM_DetachArraybuffer(env, arrayBuffer));
        JSVMTEST_CALL(OH_JSVM_DetachArraybuffer(env, arrayBuffer1));
        JSVMTEST_CALL(OH_JSVM_DetachArraybuffer(env, arrayBuffer2));
        JSVMTEST_CALL(OH_JSVM_DetachArraybuffer(env, arrayBuffer3));
        JSVMTEST_CALL(OH_JSVM_FreeArrayBufferBackingStoreData(backingStore));
    }
}

// test for Array Buffer Backing Store1
TEST(ArrayBufferBackingStore1)
{
    for (auto i = 1; i < 1000; i++) {
        void *backingStore;
        OH_JSVM_AllocateArrayBufferBackingStoreData(100, JSVM_ZERO_INITIALIZED, &backingStore);
        std::random_device rd;
        std::mt19937 gen(rd());
        std::uniform_int_distribution<> distrib(1, 20);

        int random_number = distrib(gen);
        for (auto j = 0; j < 100 / random_number - 1; j++) {
            JSVM_Value arrayBuffer;
            JSVMTEST_CALL(OH_JSVM_CreateArrayBufferFromBackingStoreData(env, backingStore, 100, j * random_number,
                                                                        random_number, &arrayBuffer));
            std::string bufferName = "buffer" + std::to_string(j);
            jsvm::SetProperty(jsvm::Global(), jsvm::Str(bufferName.c_str()), arrayBuffer);
            jsvm::Run(R"JS(
                function writeBuffer(data) {
                    let view = new Uint8Array(data);
                    // Write some values to the ArrayBuffer
                    for (let i = 0; i < view.length; i++) {
                        view[i] = i % 256;
                    }
                }
            )JS");
            std::string run_func = "writeBuffer(" + bufferName + ')';
            jsvm::Run(run_func.c_str());
            uint8_t *array = static_cast<uint8_t *>(backingStore);
            for (auto i = 0; i < 100 / random_number * random_number; ++i) {
                CHECK(array[i] >= 0);
            }
            JSVMTEST_CALL(OH_JSVM_DetachArraybuffer(env, arrayBuffer));
        }
        JSVMTEST_CALL(OH_JSVM_FreeArrayBufferBackingStoreData(backingStore));
    }
}

// test for Free Array Buffer Backing Store Data
TEST(FreeArrayBufferBackingStoreData)
{
    size_t byteLength = 100;
    JSVM_InitializedFlag initialized = JSVM_UNINITIALIZED;
    void *data;
    JSVM_Status status = OH_JSVM_AllocateArrayBufferBackingStoreData(byteLength, initialized, &data);
    CHECK(status == JSVM_OK);
    JSVM_Value result;
    status = OH_JSVM_CreateArrayBufferFromBackingStoreData(env, data, byteLength, 6, 20, &result);
    // 类型化数组
    JSVM_Value result1;
    JSVMTEST_CALL(OH_JSVM_CreateTypedarray(env, JSVM_INT8_ARRAY, 2, result, 5, &result1));
    // 验证是否为类型化后的数组
    bool isTypedArray = false;
    status = OH_JSVM_IsTypedarray(env, result1, &isTypedArray);
    CHECK(status == JSVM_OK);
    CHECK(isTypedArray == true);
    status = OH_JSVM_DetachArraybuffer(env, result);
    JSVMTEST_CALL(OH_JSVM_FreeArrayBufferBackingStoreData(data));
}
#endif
