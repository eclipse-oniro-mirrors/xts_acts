/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
 
#include <gtest/gtest.h>
#include "edm_errors.h"
#include "hilog_wrapper.h"
#define private public
#include "dev_change_callback.h"
#include "etx_device_mgr.h"
#include "ibus_extension.h"
#include "usb_bus_extension.h"
#include "bus_extension_core.h"
#include "driver_pkg_manager.h"
#undef private

namespace OHOS {
namespace ExternalDeviceManager {
using namespace std;
using namespace testing::ext;

const unordered_set<std::string> accessibleBundles = {"testBundleName1", "testBundleName2"};

class DeviceManagerTest : public testing::Test {
public:
    void SetUp() override
    {
        EDM_LOGD(MODULE_DEV_MGR, "DeviceManagerTest SetUp");
    }
    void TearDown() override
    {
        EDM_LOGD(MODULE_DEV_MGR, "DeviceManagerTest TearDown");
    }
};

static void clearDeviceMap(ExtDeviceManager &instance)
{
    unordered_map<BusType, unordered_map<uint64_t, shared_ptr<Device>>> map;
    instance.deviceMap_ = map;
}

static size_t getDeviceNum(unordered_map<uint64_t, shared_ptr<Device>> map)
{
    size_t num = 0;
    for (auto &[_, device] : map) {
        if (!device->IsUnRegisted()) {
            num++;
        }
    }
    return num;
}

HWTEST_F(DeviceManagerTest, BusExtensionRegisterTest, Function | MediumTest | Level1)
{
    BusExtensionCore &core = BusExtensionCore::GetInstance();
    int32_t ret = core.Register(BusType::BUS_TYPE_USB, std::make_shared<UsbBusExtension>());
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_NE(core.busExtensions_[BusType::BUS_TYPE_USB], nullptr);
}

HWTEST_F(DeviceManagerTest, InitTest, TestSize.Level1)
{
    DriverPkgManager::GetInstance().Init();
    int32_t ret = ExtDeviceManager::GetInstance().Init();
    ASSERT_EQ(ret, EDM_OK);
}

// test OnDeviceAdd and OnDeviceRemove
HWTEST_F(DeviceManagerTest, OnDeviceAddRemoveTest001, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> device = std::make_shared<DeviceInfo>(0);
    device->devInfo_.devBusInfo.busType = BusType::BUS_TYPE_TEST;
    device->devInfo_.devBusInfo.busDeviceId = 1;
    int32_t ret = callback->OnDeviceAdd(device);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    ret = callback->OnDeviceRemove(device);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 0);
}

// test adding device repeatedly
HWTEST_F(DeviceManagerTest, OnDeviceAddRemoveTest002, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> device = std::make_shared<DeviceInfo>(0);
    device->devInfo_.devBusInfo.busType = BusType::BUS_TYPE_TEST;
    device->devInfo_.devBusInfo.busDeviceId = 1;
    int32_t ret = callback->OnDeviceAdd(device);
    ASSERT_EQ(ret, EDM_OK);
    ret = callback->OnDeviceAdd(device);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    ret = callback->OnDeviceRemove(device);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 0);
    ret = callback->OnDeviceRemove(device);
    ASSERT_EQ(ret, EDM_OK);
}

HWTEST_F(DeviceManagerTest, OnDeviceAddRemoveTest003, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> device0 = std::make_shared<DeviceInfo>(0);
    device0->devInfo_.devBusInfo.busType = BusType::BUS_TYPE_TEST;
    device0->devInfo_.devBusInfo.busDeviceId = 1;
    int32_t ret = callback->OnDeviceAdd(device0);
    ASSERT_EQ(ret, EDM_OK);
    std::shared_ptr<DeviceInfo> device1 = std::make_shared<DeviceInfo>(0);
    device1->devInfo_.devBusInfo.busType = BusType::BUS_TYPE_TEST;
    device1->devInfo_.devBusInfo.busDeviceId = 2;
    ret = callback->OnDeviceAdd(device1);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 2);
    ret = callback->OnDeviceRemove(device1);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    ret = callback->OnDeviceRemove(device0);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 0);
}

HWTEST_F(DeviceManagerTest, QueryDeviceTest, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    std::vector<std::shared_ptr<DeviceInfo>> devVec = extMgr.QueryDevice(BUS_TYPE_TEST);
    ASSERT_EQ(devVec.size(), 0);
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> device0 = std::make_shared<DeviceInfo>(0);
    device0->devInfo_.devBusInfo.busType = BusType::BUS_TYPE_TEST;
    device0->devInfo_.devBusInfo.busDeviceId = 1;
    int32_t ret = callback->OnDeviceAdd(device0);
    ASSERT_EQ(ret, EDM_OK);
    std::shared_ptr<DeviceInfo> device1 = std::make_shared<DeviceInfo>(0);
    device1->devInfo_.devBusInfo.busType = BusType::BUS_TYPE_TEST;
    device1->devInfo_.devBusInfo.busDeviceId = 2;
    ret = callback->OnDeviceAdd(device1);
    ASSERT_EQ(ret, EDM_OK);
    devVec = extMgr.QueryDevice(BUS_TYPE_TEST);
    ASSERT_EQ(devVec.size(), 2);
    ret = callback->OnDeviceRemove(device0);
    ret = callback->OnDeviceRemove(device1);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 0);
}

HWTEST_F(DeviceManagerTest, GetBusExtensionByNameTest, Function | MediumTest | Level1)
{
    BusExtensionCore &core = BusExtensionCore::GetInstance();
    ASSERT_NE(core.busExtensions_[BusType::BUS_TYPE_USB], nullptr);
    std::shared_ptr<IBusExtension> extension = core.GetBusExtensionByName("HDMI");
    ASSERT_EQ(extension, nullptr);
    extension = core.GetBusExtensionByName("USB");
    ASSERT_NE(extension, nullptr);
    core.busExtensions_.erase(BusType::BUS_TYPE_USB);
    extension = core.GetBusExtensionByName("USB");
    ASSERT_EQ(extension, nullptr);
}

class TestRemoteObjectStub : public IRemoteObject {
public:
    TestRemoteObjectStub() : IRemoteObject(u"IRemoteObject") {}
    int32_t GetObjectRefCount() { return 0; };
    int SendRequest(uint32_t code, MessageParcel &data, MessageParcel &reply, MessageOption &option) { return 0; };
    bool AddDeathRecipient(const sptr<DeathRecipient> &recipient) { return true; };
    bool RemoveDeathRecipient(const sptr<DeathRecipient> &recipient) { return true; };
    int Dump(int fd, const std::vector<std::u16string> &args) { return 0; };
};

class TestDriverExtMgrCallback : public IDriverExtMgrCallback {
public:
    TestDriverExtMgrCallback() {}
    sptr<IRemoteObject> AsObject()
    {
        return sptr<TestRemoteObjectStub>::MakeSptr();
    };
    void OnConnect(uint64_t deviceId, const sptr<IRemoteObject> &drvExtObj, const ErrMsg &errMsg)
    {
        EDM_LOGD(MODULE_DEV_MGR, "TestDriverExtMgrCallback::OnConnect entry");
    };
    void OnDisconnect(uint64_t deviceId, const ErrMsg &errMsg)
    {
        EDM_LOGD(MODULE_DEV_MGR, "TestDriverExtMgrCallback::OnConnect entry");
    };
    void OnUnBind(uint64_t deviceId, const ErrMsg &errMsg)
    {
        EDM_LOGD(MODULE_DEV_MGR, "TestDriverExtMgrCallback::OnConnect entry");
    };
};

HWTEST_F(DeviceManagerTest, ConnectDeviceTest, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    uint64_t deviceId = 3;
    const uint32_t tokenId1 = 1;
    sptr<IDriverExtMgrCallback> connectCallback = sptr<TestDriverExtMgrCallback>::MakeSptr();
    int32_t ret = extMgr.ConnectDevice(deviceId, tokenId1, connectCallback);
    ASSERT_EQ(ret, EDM_NOK);
    std::shared_ptr<Device> device = extMgr.QueryDeviceByDeviceID(deviceId);
    ASSERT_EQ(device, nullptr);

    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> deviceInfo = std::make_shared<DeviceInfo>(deviceId,
        BusType::BUS_TYPE_TEST, "testInfo1");
    deviceInfo->devInfo_.deviceId = deviceId;
    ret = callback->OnDeviceAdd(deviceInfo);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    device = extMgr.QueryDeviceByDeviceID(deviceId);
    ASSERT_NE(device, nullptr);
    device->driverInfo_ = make_shared<DriverInfo>("testBundleName1", "testDriverName1");
    ASSERT_EQ(device->driverInfo_->launchOnBind_, false);
    ret = extMgr.ConnectDevice(deviceId, tokenId1, connectCallback);
    ASSERT_NE(ret, EDM_OK);

    sptr<IRemoteObject> remote = sptr<TestRemoteObjectStub>::MakeSptr();
    int resultCode = static_cast<int>(UsbErrCode::EDM_OK);
    device->OnConnect(remote, resultCode);
    ASSERT_EQ(device->boundCallerInfos_.size(), 0);
    ASSERT_NE(device->drvExtRemote_, nullptr);
    device->driverInfo_->accessAllowed_ = true;
    ret = extMgr.ConnectDevice(deviceId, tokenId1, connectCallback);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 1);
    const uint32_t tokenId2 = 2;
    ret = extMgr.ConnectDevice(deviceId, tokenId2, connectCallback);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 2);
    auto iter = device->boundCallerInfos_.find(tokenId1);
    ASSERT_NE(iter, device->boundCallerInfos_.end());
    ASSERT_EQ(iter->second.isBound, true);
    iter = device->boundCallerInfos_.find(tokenId2);
    ASSERT_NE(iter, device->boundCallerInfos_.end());
    ASSERT_EQ(iter->second.isBound, true);
}

HWTEST_F(DeviceManagerTest, ConnectDeviceTest1, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    uint64_t deviceId = 3;
    const uint32_t tokenId = 1;
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> deviceInfo = std::make_shared<DeviceInfo>(deviceId,
        BusType::BUS_TYPE_TEST, "testInfo1");
    deviceInfo->devInfo_.deviceId = deviceId;
    int32_t ret = callback->OnDeviceAdd(deviceInfo);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    std::shared_ptr<Device> device = extMgr.QueryDeviceByDeviceID(deviceId);
    ASSERT_NE(device, nullptr);
    sptr<IDriverExtMgrCallback> connectCallback = sptr<TestDriverExtMgrCallback>::MakeSptr();

    device->driverInfo_ = make_shared<DriverInfo>("testBundleName1", "testDriverName1");
    device->driverInfo_->accessAllowed_ = false;
    ret = extMgr.ConnectDriverWithDeviceId(deviceId, tokenId, accessibleBundles, connectCallback);
    ASSERT_EQ(ret, EDM_ERR_SERVICE_NOT_ALLOW_ACCESS);

    device->driverInfo_->accessAllowed_ = true;
    ret = extMgr.ConnectDriverWithDeviceId(deviceId, tokenId, accessibleBundles, connectCallback);
    ASSERT_NE(ret, EDM_ERR_SERVICE_NOT_ALLOW_ACCESS);
}

HWTEST_F(DeviceManagerTest, ConnectDeviceTest2, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    uint64_t deviceId = 3;
    const uint32_t tokenId = 1;
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> deviceInfo = std::make_shared<DeviceInfo>(deviceId,
        BusType::BUS_TYPE_TEST, "testInfo1");
    deviceInfo->devInfo_.deviceId = deviceId;
    int32_t ret = callback->OnDeviceAdd(deviceInfo);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    std::shared_ptr<Device> device = extMgr.QueryDeviceByDeviceID(deviceId);
    ASSERT_NE(device, nullptr);
    sptr<IDriverExtMgrCallback> connectCallback = sptr<TestDriverExtMgrCallback>::MakeSptr();

    device->driverInfo_ = make_shared<DriverInfo>("testBundleName3", "testDriverName3");
    device->driverInfo_->accessAllowed_ = true;
    ret = extMgr.ConnectDriverWithDeviceId(deviceId, tokenId, accessibleBundles, connectCallback);
    ASSERT_EQ(ret, EDM_ERR_NO_PERM);

    device->driverInfo_->bundleName_ = "testBundleName1";
    ret = extMgr.ConnectDriverWithDeviceId(deviceId, tokenId, accessibleBundles, connectCallback);
    ASSERT_NE(ret, EDM_ERR_NO_PERM);
}

HWTEST_F(DeviceManagerTest, DisConnectDeviceTest, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    uint64_t deviceId = 3;
    const uint32_t tokenId1 = 1;
    sptr<IDriverExtMgrCallback> connectCallback = sptr<TestDriverExtMgrCallback>::MakeSptr();
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> deviceInfo = std::make_shared<DeviceInfo>(deviceId,
        BusType::BUS_TYPE_TEST, "testInfo2");
    deviceInfo->devInfo_.deviceId = deviceId;
    int32_t ret = callback->OnDeviceAdd(deviceInfo);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    std::shared_ptr<Device> device = extMgr.QueryDeviceByDeviceID(deviceId);
    device->driverInfo_ = make_shared<DriverInfo>("testBundleName2", "testDriverName2");
    ret = extMgr.ConnectDevice(deviceId, tokenId1, connectCallback);
    ASSERT_NE(ret, EDM_OK);

    sptr<IRemoteObject> remote = sptr<TestRemoteObjectStub>::MakeSptr();
    device->OnConnect(remote, static_cast<int>(UsbErrCode::EDM_OK));
    ASSERT_EQ(device->boundCallerInfos_.size(), 0);
    ASSERT_NE(device->drvExtRemote_, nullptr);
    device->driverInfo_->accessAllowed_ = true;
    ret = extMgr.ConnectDevice(deviceId, tokenId1, connectCallback);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 1);

    const uint32_t tokenId2 = 2;
    ret = extMgr.ConnectDevice(deviceId, tokenId2, connectCallback);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 2);
    auto iter = device->boundCallerInfos_.find(tokenId1);
    ASSERT_NE(iter, device->boundCallerInfos_.end());
    ASSERT_EQ(iter->second.isBound, true);
    iter = device->boundCallerInfos_.find(tokenId2);
    ASSERT_NE(iter, device->boundCallerInfos_.end());
    ASSERT_EQ(iter->second.isBound, true);
    ret = extMgr.DisConnectDevice(deviceId, tokenId2);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 1);
    iter = device->boundCallerInfos_.begin();
    ASSERT_EQ(iter->first, tokenId1);
    ASSERT_EQ(iter->second.isBound, true);
    device->driverInfo_->launchOnBind_ = true;
    ret = extMgr.DisConnectDevice(deviceId, tokenId1);
    ASSERT_NE(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 1);
    device->driverInfo_->launchOnBind_ = false;
    ret = extMgr.DisConnectDevice(deviceId, tokenId1);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 0);
}

HWTEST_F(DeviceManagerTest, DisConnectDeviceTest1, Function | MediumTest | Level1)
{
    ExtDeviceManager &extMgr = ExtDeviceManager::GetInstance();
    clearDeviceMap(extMgr);
    uint64_t deviceId = 3;
    const uint32_t tokenId1 = 1;
    std::shared_ptr<DevChangeCallback> callback = std::make_shared<DevChangeCallback>();
    std::shared_ptr<DeviceInfo> deviceInfo = std::make_shared<DeviceInfo>(deviceId,
        BusType::BUS_TYPE_TEST, "testInfo2");
    deviceInfo->devInfo_.deviceId = deviceId;
    int32_t ret = callback->OnDeviceAdd(deviceInfo);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(getDeviceNum(extMgr.deviceMap_[BusType::BUS_TYPE_TEST]), 1);
    std::shared_ptr<Device> device = extMgr.QueryDeviceByDeviceID(deviceId);
    device->driverInfo_ = make_shared<DriverInfo>("testBundleName2", "testDriverName2");
    sptr<IRemoteObject> remote = sptr<TestRemoteObjectStub>::MakeSptr();
    device->OnConnect(remote, static_cast<int>(UsbErrCode::EDM_OK));
    ASSERT_NE(device->drvExtRemote_, nullptr);
    sptr<IDriverExtMgrCallback> connectCallback = sptr<TestDriverExtMgrCallback>::MakeSptr();

    device->driverInfo_->accessAllowed_ = true;
    ret = extMgr.ConnectDriverWithDeviceId(deviceId, tokenId1, accessibleBundles, connectCallback);
    ASSERT_EQ(ret, EDM_OK);
    ASSERT_EQ(device->boundCallerInfos_.size(), 1);

    const uint32_t tokenId2 = 2;
    ret = extMgr.DisConnectDriverWithDeviceId(deviceId, tokenId2);
    ASSERT_EQ(ret, EDM_ERR_SERVICE_NOT_BOUND);

    ret = extMgr.DisConnectDriverWithDeviceId(deviceId, tokenId1);
    ASSERT_NE(ret, EDM_ERR_SERVICE_NOT_BOUND);
}
} // namespace ExternalDeviceManager
} // namespace OHOS
