/*
 * Copyright (c) 2021 Huawei Device Co., Ltd.
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
#include <securec.h>
#include <gtest/gtest.h>
#include <surface.h>
#include <consumer_surface.h>
#include "buffer_consumer_listener.h"
#include <native_window.h>
#include "sync_fence.h"
#include "producer_surface_delegator.h"

using namespace testing;
using namespace testing::ext;

namespace OHOS::Rosen {
class ProducerSurfaceTest : public testing::Test {
public:
    static void SetUpTestCase();
    static void TearDownTestCase();

    static inline BufferRequestConfig requestConfig = {
        .width = 0x100,
        .height = 0x100,
        .strideAlignment = 0x8,
        .format = GRAPHIC_PIXEL_FMT_RGBA_8888,
        .usage = BUFFER_USAGE_CPU_READ | BUFFER_USAGE_CPU_WRITE | BUFFER_USAGE_MEM_DMA,
        .timeout = 0,
    };
    static inline BufferFlushConfig flushConfig = {
        .damage = {
            .w = 0x100,
            .h = 0x100,
        },
    };
    static inline int64_t timestamp = 0;
    static inline Rect damage = {};
    static inline sptr<IConsumerSurface> csurf = nullptr;
    static inline sptr<IBufferProducer> producer = nullptr;
    static inline sptr<Surface> pSurface = nullptr;
    static inline sptr<ProducerSurfaceDelegator> surfaceDelegator = nullptr;

    static inline GSError OnBufferRelease(sptr<SurfaceBuffer> &buffer)
    {
        return GSERROR_OK;
    }
};

void ProducerSurfaceTest::SetUpTestCase()
{
    csurf = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listener = new BufferConsumerListener();
    csurf->RegisterConsumerListener(listener);
    producer = csurf->GetProducer();
    pSurface = Surface::CreateSurfaceAsProducer(producer);
    pSurface->RegisterReleaseListener(OnBufferRelease);
}

void ProducerSurfaceTest::TearDownTestCase()
{
    pSurface->UnRegisterReleaseListener();
    csurf = nullptr;
    producer = nullptr;
    pSurface = nullptr;
}

/*
 * @tc.name  : UserDataChangeListen001
 * @tc.desc  : Register UserData Change Listener
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(ProducerSurfaceTest, UserDataChangeListen001, Function | MediumTest | Level2)
{
    sptr<IConsumerSurface> csurfTestUserData = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listenerTestUserData = new BufferConsumerListener();
    csurfTestUserData->RegisterConsumerListener(listenerTestUserData);
    sptr<IBufferProducer> producerTestUserData = csurf->GetProducer();
    sptr<Surface> pSurfaceTestUserData = Surface::CreateSurfaceAsProducer(producerTestUserData);

    GSError ret1 = OHOS::GSERROR_INVALID_ARGUMENTS;
    GSError ret2 = OHOS::GSERROR_INVALID_ARGUMENTS;
    auto func1 = [&ret1](const std::string& key, const std::string& value) {
        ret1 = OHOS::GSERROR_OK;
    };
    auto func2 = [&ret2](const std::string& key, const std::string& value) {
        ret2 = OHOS::GSERROR_OK;
    };
    pSurfaceTestUserData->RegisterUserDataChangeListener("func1", func1);
    pSurfaceTestUserData->RegisterUserDataChangeListener("func2", func2);
    pSurfaceTestUserData->RegisterUserDataChangeListener("func3", nullptr);
    ASSERT_EQ(pSurfaceTestUserData->RegisterUserDataChangeListener("func2", func2), OHOS::GSERROR_INVALID_ARGUMENTS);

    if (pSurfaceTestUserData->SetUserData("Regist", "OK") == OHOS::GSERROR_OK) {
        ASSERT_EQ(ret1, OHOS::GSERROR_OK);
        ASSERT_EQ(ret2, OHOS::GSERROR_OK);
    }

    ret1 = OHOS::GSERROR_INVALID_ARGUMENTS;
    ret2 = OHOS::GSERROR_INVALID_ARGUMENTS;
    pSurfaceTestUserData->UnRegisterUserDataChangeListener("func1");
    ASSERT_EQ(pSurfaceTestUserData->UnRegisterUserDataChangeListener("func1"), OHOS::GSERROR_INVALID_ARGUMENTS);

    if (pSurfaceTestUserData->SetUserData("UnRegist", "INVALID") == OHOS::GSERROR_OK) {
        ASSERT_EQ(ret1, OHOS::GSERROR_INVALID_ARGUMENTS);
        ASSERT_EQ(ret2, OHOS::GSERROR_OK);
    }

    ret1 = OHOS::GSERROR_INVALID_ARGUMENTS;
    ret2 = OHOS::GSERROR_INVALID_ARGUMENTS;
    pSurfaceTestUserData->ClearUserDataChangeListener();
    pSurfaceTestUserData->RegisterUserDataChangeListener("func1", func1);
    if (pSurfaceTestUserData->SetUserData("Clear", "OK") == OHOS::GSERROR_OK) {
        ASSERT_EQ(ret1, OHOS::GSERROR_OK);
        ASSERT_EQ(ret2, OHOS::GSERROR_INVALID_ARGUMENTS);
    }
}

/*
 * @tc.name  : UserDataChangeListen002
 * @tc.desc  : Register UserData Change Listener
 * @tc.size  : MediumTest
 * @tc.type  : Function
 * @tc.level : Level 2
 */
HWTEST_F(ProducerSurfaceTest, UserDataChangeListen002, Function | MediumTest | Level2)
{
    sptr<IConsumerSurface> csurfTestUserData = IConsumerSurface::Create();
    sptr<IBufferConsumerListener> listenerTestUserData = new BufferConsumerListener();
    csurfTestUserData->RegisterConsumerListener(listenerTestUserData);
    sptr<IBufferProducer> producerTestUserData = csurf->GetProducer();
    sptr<Surface> pSurfaceTestUserData = Surface::CreateSurfaceAsProducer(producerTestUserData);

    auto func = [&pSurfaceTestUserData](const std::string& FuncName) {
        constexpr int32_t RegisterListenerNum = 1000;
        std::vector<GSError> ret(RegisterListenerNum, OHOS::GSERROR_INVALID_ARGUMENTS);
        std::string strs[RegisterListenerNum];
        constexpr int32_t stringLengthMax = 32;
        char str[stringLengthMax] = {};
        for (int i = 0; i < RegisterListenerNum; i++) {
            auto secRet = snprintf_s(str, sizeof(str), sizeof(str) - 1, "%s%d", FuncName.c_str(), i);
            ASSERT_GT(secRet, 0);
            strs[i] = str;
            ASSERT_EQ(pSurfaceTestUserData->RegisterUserDataChangeListener(strs[i], [i, &ret]
            (const std::string& key, const std::string& value) {
                ret[i] = OHOS::GSERROR_OK;
            }), OHOS::GSERROR_OK);
        }

        if (pSurfaceTestUserData->SetUserData("Regist", FuncName) == OHOS::GSERROR_OK) {
            for (int i = 0; i < RegisterListenerNum; i++) {
                ASSERT_EQ(ret[i], OHOS::GSERROR_OK);
            }
        }

        for (int i = 0; i < RegisterListenerNum; i++) {
            pSurfaceTestUserData->UnRegisterUserDataChangeListener(strs[i]);
        }
    };

    std::thread t1(func, "thread1");
    std::thread t2(func, "thread2");
    t1.join();
    t2.join();
}

}
