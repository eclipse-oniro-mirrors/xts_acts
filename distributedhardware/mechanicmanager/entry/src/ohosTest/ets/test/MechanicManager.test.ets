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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium';
import { Driver, ON } from '@ohos.UiTest';
import mechanicManager from '@ohos.distributedHardware.mechanicManager'

export default function MechanicManagerAPI() {
  describe('MechanicManagerAPI', () => {

    let sleep = (ms: number) => {
      return new Promise<string>(resolve => setTimeout(resolve, ms));
    }

    let driveFn = async () => {
      try {
        let driver: Driver = await Driver.create()
        console.info('come in driveFn')
        console.info('driver is ${JSON.stringify(driver)}')
        await sleep(1000);
        let button = await driver.findComponent(ON.text('允许'));
        console.info('button is ${JSON.stringify(button)}');
        await sleep(1000);
        await button.click();
        await sleep(1000);
      } catch (err) {
        console.info('err is ' + err);
        return;
      }
    }

    beforeAll(async (done: Function) => {
      console.info(('beforeAll called'));
      await sleep(1000);
      done();
    })
    beforeEach(async (done: Function) => {
      console.info(('beforeEach called'));
      done();
    })
    afterEach(async (done: Function) => {
      console.info('afterEach called');
      setTimeout(done, 1000);
      done();
    })
    afterAll(async (done: Function) => {
      console.info('afterAll called');
      // console.info(logTag +'[bluetooth_js] bt close');
      // btAccess.disableBluetooth();
      // await sleep(5000);
      // await clickRequestPermission(CLOSE_BT_TEXT);
      done();
    });
    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0100
     * @tc.name       : SUB_DH_MechanicManager_on_0100
     * @tc.desc       : Subscribes to device attachment state change events,mechanicManager.on接口正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("SUB_DH_MechanicManager_on_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.log("-----------------SUB_DH_MechanicManager_on_0100 begin-----------------");
      try {
        mechanicManager.on("attachStateChange", (data) => {
          console.log("SUB_DH_MechanicManager_on_0100 mechanicManager.on success, data:" + JSON.stringify(data));
        });
        console.log("SUB_DH_MechanicManager_on_0100 mechanicManager.on success");
        expect(true).assertTrue();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_on_0100 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect(false).assertFail();
      }
      console.log("-----------------SUB_DH_MechanicManager_on_0100 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0200
     * @tc.name       : SUB_DH_MechanicManager_on_0200
     * @tc.desc       : Subscribes to device attachment state change events,mechanicManager.on接口入参callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_on_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_on_0200 begin-----------------");
      try {
        mechanicManager.on("attachStateChange", null);
        console.info("SUB_DH_MechanicManager_on_0200 mechanicManager.on success" + ",expect fail");
        expect().assertFalse()
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_on_0200 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        console.info("-----------------SUB_DH_MechanicManager_on_0200 end-----------------");
      }
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0300
     * @tc.name       : SUB_DH_MechanicManager_on_0300
     * @tc.desc       : Subscribes to device attachment state change events,mechanicManager.on接口入参callback为undefined
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_on_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_on_0300 begin-----------------");
      try {
        mechanicManager.on("attachStateChange",undefined);
        console.info("SUB_DH_MechanicManager_on_0300 mechanicManager.on success" + ",expect fail");
        expect().assertFalse()
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_on_0300 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        }
      console.info("-----------------SUB_DH_MechanicManager_on_0300 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0100
     * @tc.name       : SUB_DH_MechanicManager_off_0100
     * @tc.desc       : Unsubscribes from device attachment state change events,mechanicManager.off接口正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("SUB_DH_MechanicManager_off_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0100 begin-----------------");
      try {
        mechanicManager.off("attachStateChange", (data) => {
          console.log("SUB_DH_MechanicManager_off_0100 mechanicManager.off success, data:" + JSON.stringify(data));
        });
        console.log("SUB_DH_MechanicManager_off_0100 mechanicManager.off success");
        expect(true).assertTrue();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0100 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(false).assertFail();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0100 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0200
     * @tc.name       : SUB_DH_MechanicManager_off_0200
     * @tc.desc       : Unsubscribes from device attachment state change events,mechanicManager.off接口回调为空
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("SUB_DH_MechanicManager_off_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0200 begin-----------------");
      try {
        mechanicManager.off("attachStateChange");
        console.log("SUB_DH_MechanicManager_off_0200 mechanicManager.off success");
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0200 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0200 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0300
     * @tc.name       : SUB_DH_MechanicManager_off_0300
     * @tc.desc       : Unsubscribes from device attachment state change events,mechanicManager.off接口回调callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_off_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0300 begin-----------------");
      try {
        mechanicManager.off("attachStateChange",null);
        console.log("SUB_DH_MechanicManager_off_0300 mechanicManager.off success");
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0300 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0300 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0400
     * @tc.name       : SUB_DH_MechanicManager_off_0400
     * @tc.desc       : Unsubscribes from device attachment state change events,mechanicManager.off接口回调callback为undefined
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_off_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0400 begin-----------------");
      try {
        mechanicManager.off("attachStateChange",undefined);
        console.log("SUB_DH_MechanicManager_off_0400 mechanicManager.off success");
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0400 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0400 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_getAttachedMechDevices_0100
     * @tc.name       : SUB_DH_MechanicManager_getAttachedMechDevices_0100
     * @tc.desc       : Obtain the list of connected mechanical devices,mechanicManager.getAttachedMechDevices接口正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_getAttachedMechDevices_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async () => {
        console.info("-----------------SUB_DH_MechanicManager_getAttachedMechDevices_0100 begin-----------------");
        try {
          let mechInfos: mechanicManager.MechInfo[] = mechanicManager.getAttachedMechDevices();
          console.info('SUB_DH_MechanicManager_getAttachedMechDevices_0100 设备列表: ' + JSON.stringify(mechInfos));
          expect(mechInfos[0].mechId == 0).assertTrue();
          expect(mechInfos[0].mechDeviceType == 0).assertTrue();
          expect(mechInfos[0].mechName == "Osmo Mobile 7P").assertTrue();
        } catch (error) {
          console.error('SUB_DH_MechanicManager_getAttachedMechDevices_0100 查询失败, code: ' + error.code +
            ' message: ' + error.message);
          expect(error.code == 33300001).assertTrue();
        }
        console.info("-----------------SUB_DH_MechanicManager_getAttachedMechDevices_0100 end-----------------");
      });

    /**
     * @tc.number     : SUB_DH_MechanicManager_setCameraTrackingEnabled_0100
     * @tc.name       : SUB_DH_MechanicManager_setCameraTrackingEnabled_0100
     * @tc.desc       : Checks whether camera tracking is enabled for this mechanical device,启用当前机械体设备摄像头跟踪
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_setCameraTrackingEnabled_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0100 begin-----------------");
      try {
        mechanicManager.setCameraTrackingEnabled(true);
        console.info('SUB_DH_MechanicManager_setCameraTrackingEnabled_0100 Enable Tracking Success');
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_setCameraTrackingEnabled_0100 failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001||error.code == 33300002||error.code == 33300003).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0100 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_setCameraTrackingEnabled_0200
     * @tc.name       : SUB_DH_MechanicManager_setCameraTrackingEnabled_0200
     * @tc.desc       : Checks whether camera tracking is enabled for this mechanical device,禁用当前机械体设备摄像头跟踪
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_setCameraTrackingEnabled_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0200 begin-----------------");
      try {
        mechanicManager.setCameraTrackingEnabled(false);
        console.info('SUB_DH_MechanicManager_setCameraTrackingEnabled_0200 Enable Tracking Success');
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_setCameraTrackingEnabled_0200 failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001||error.code == 33300002||error.code == 33300003).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0200 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_setCameraTrackingEnabled_0300
     * @tc.name       : SUB_DH_MechanicManager_setCameraTrackingEnabled_0300
     * @tc.desc       : Checks whether camera tracking is enabled for this mechanical device,setCameraTrackingEnabled参数为null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_setCameraTrackingEnabled_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0300 begin-----------------");
      try {
        mechanicManager.setCameraTrackingEnabled(null);
        console.info('SUB_DH_MechanicManager_setCameraTrackingEnabled_0300 Enable Tracking Success');
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_setCameraTrackingEnabled_0300 failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0300 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_setCameraTrackingEnabled_0400
     * @tc.name       : SUB_DH_MechanicManager_setCameraTrackingEnabled_0400
     * @tc.desc       : Checks whether camera tracking is enabled for this mechanical device,setCameraTrackingEnabled参数为undefined
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_setCameraTrackingEnabled_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0400 begin-----------------");
      try {
        mechanicManager.setCameraTrackingEnabled(undefined);
        console.info('SUB_DH_MechanicManager_setCameraTrackingEnabled_0400 Enable Tracking Success');
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_setCameraTrackingEnabled_0400 failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_setCameraTrackingEnabled_0400 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_getCameraTrackingEnabled_0100
     * @tc.name       : SUB_DH_MechanicManager_getCameraTrackingEnabled_0100
     * @tc.desc       : Subscribes to tracking events,getCameraTrackingEnabled调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_getCameraTrackingEnabled_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_getCameraTrackingEnabled_0100 begin-----------------");
      try {
        let enabled = mechanicManager.getCameraTrackingEnabled();
        console.info(`'SUB_DH_MechanicManager_getCameraTrackingEnabled_0100 current tracking status:' ${enabled}`);
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_getCameraTrackingEnabled_0100 failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001||error.code == 33300002).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_getCameraTrackingEnabled_0100 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0400
     * @tc.name       : SUB_DH_MechanicManager_on_0400
     * @tc.desc       : Subscribes to tracking events，mechanicManager.on('trackingStateChange')接口调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_on_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_on_0400 begin-----------------");
      try {
        mechanicManager.on("trackingStateChange", (data) => {
          console.log("SUB_DH_MechanicManager_on_0400 mechanicManager.on success, data:" + JSON.stringify(data));
          expect(false).assertFail();
        });
        console.log("SUB_DH_MechanicManager_on_0400 mechanicManager.on success" + ",expect fail");
      } catch (error) {
        console.log(`SUB_DH_MechanicManager_on_0400 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_on_0400 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0500
     * @tc.name       : SUB_DH_MechanicManager_on_0500
     * @tc.desc       : Subscribes to tracking events,mechanicManager.on接口入参callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_on_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_on_0500 begin-----------------");
      try {
        mechanicManager.on("trackingStateChange", null);
        console.info("SUB_DH_MechanicManager_on_0500 mechanicManager.on success" + ",expect fail");
        expect().assertFalse()
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_on_0500 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        console.info("-----------------SUB_DH_MechanicManager_on_0500 end-----------------");
      }
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0600
     * @tc.name       : SUB_DH_MechanicManager_on_0600
     * @tc.desc       : Subscribes to tracking events,mechanicManager.on接口入参callback为undefined
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_on_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_on_0600 begin-----------------");
      try {
        mechanicManager.on("trackingStateChange", undefined);
        console.info("SUB_DH_MechanicManager_on_0600 mechanicManager.on success" + ",expect fail");
        expect().assertFalse()
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_on_0600 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
        console.info("-----------------SUB_DH_MechanicManager_on_0600 end-----------------");
      }
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0700
     * @tc.name       : SUB_DH_MechanicManager_on_0700
     * @tc.desc       : Subscribes to tracking events,mechanicManager.on接口调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_on_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log("-----------------SUB_DH_MechanicManager_on_0700 begin-----------------");
      try {
        let callback = (result: mechanicManager.TrackingEventInfo) => {
          console.info(`'SUB_DH_MechanicManager_on_0700 callback result: ' ${JSON.stringify(result)}`);
          expect(result.event === mechanicManager.TrackingEvent.CAMERA_TRACKING_USER_ENABLED ||
            result.event === mechanicManager.TrackingEvent.CAMERA_TRACKING_USER_DISABLED ||
            result.event === mechanicManager.TrackingEvent.CAMERA_TRACKING_LAYOUT_CHANGED
          ).assertTrue();
          done();
        };
        console.info('SUB_DH_MechanicManager_on_0700 Register');
        mechanicManager.on("trackingStateChange", callback);
        console.info('SUB_DH_MechanicManager_on_0700 Register: success');
        let isTrack = mechanicManager.getCameraTrackingEnabled();
        console.info(`'SUB_DH_MechanicManager_on_0700 tracking status:' ${isTrack}`);
        mechanicManager.setCameraTrackingEnabled(!isTrack);
        let isTrack2 = mechanicManager.getCameraTrackingEnabled();
        console.info(`'SUB_DH_MechanicManager_on_0700 tracking status:' ${isTrack2}`);
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_on_0700 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001).assertTrue();
        done();
      }
      done();
      console.log("-----------------SUB_DH_MechanicManager_on_0700 end-----------------");
    });
 
    /**
     * @tc.number     : SUB_DH_MechanicManager_on_0800
     * @tc.name       : SUB_DH_MechanicManager_on_0800
     * @tc.desc       : Subscribes to device attachment state change events,mechanicManager.on接口正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("SUB_DH_MechanicManager_on_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.log("-----------------SUB_DH_MechanicManager_on_0800 begin-----------------");
      try {
        let callback = (result: mechanicManager.AttachStateChangeInfo) => {
          console.info(`'SUB_DH_MechanicManager_on_0800 callback result: ' ${JSON.stringify(result)}`);
          expect(result.state === mechanicManager.AttachState.ATTACHED ||
            result.state === mechanicManager.AttachState.DETACHED).assertTrue();
          expect(result.mechInfo[0].mechId == 0).assertTrue();
          expect(result.mechInfo[0].mechDeviceType == 0).assertTrue();
          expect(result.mechInfo[0].mechName == "Osmo Mobile 7P").assertTrue();
          done();
        };
        console.info('SUB_DH_MechanicManager_on_0800 Register');
        mechanicManager.on("attachStateChange", callback);
        console.info('SUB_DH_MechanicManager_on_0800 Register: success');
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_on_0800 mechanicManager.on failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFail();
        done();
      }
      done();
      console.log("-----------------SUB_DH_MechanicManager_on_0800 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0500
     * @tc.name       : SUB_DH_MechanicManager_off_0500
     * @tc.desc       : Unsubscribes from tracking events,mechanicManager.off接口正常调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("SUB_DH_MechanicManager_off_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0500 begin-----------------");
      try {
        mechanicManager.off("trackingStateChange", (data) => {
          console.log("SUB_DH_MechanicManager_off_0500 mechanicManager.off success, data:" + JSON.stringify(data));
        });
        console.log("SUB_DH_MechanicManager_off_0500 mechanicManager.off success");
        expect(true).assertTrue();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0500 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(false).assertFail();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0100 end-----------------");
    });
    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0600
     * @tc.name       : SUB_DH_MechanicManager_off_0600
     * @tc.desc       : Unsubscribes from tracking events,mechanicManager.off接口回调为空
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it("SUB_DH_MechanicManager_off_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0600 begin-----------------");
      try {
        mechanicManager.off("trackingStateChange");
        console.log("SUB_DH_MechanicManager_off_0600 mechanicManager.off success");
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0600 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0600 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0700
     * @tc.name       : SUB_DH_MechanicManager_off_0700
     * @tc.desc       : Unsubscribes from tracking events,mechanicManager.off接口回调callback为null
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_off_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0700 begin-----------------");
      try {
        mechanicManager.off("trackingStateChange",null);
        console.log("SUB_DH_MechanicManager_off_0700 mechanicManager.off success");
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0700 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0700 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_off_0800
     * @tc.name       : SUB_DH_MechanicManager_off_0800
     * @tc.desc       : Unsubscribes from tracking events,mechanicManager.off接口回调callback为undefined
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_off_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_off_0800 begin-----------------");
      try {
        mechanicManager.off("trackingStateChange",undefined);
        console.log("SUB_DH_MechanicManager_off_0800 mechanicManager.off success");
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_off_0800 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 401).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_off_0800 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_getCameraTrackingLayout_0100
     * @tc.name       : SUB_DH_MechanicManager_getCameraTrackingLayout_0100
     * @tc.desc       : Obtains the camera tracking layout of this mechanical device,getCameraTrackingLayout接口调用
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_getCameraTrackingLayout_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_getCameraTrackingLayout_0100 begin-----------------");
      try {
        let layout = mechanicManager.getCameraTrackingLayout();
        console.info(`'SUB_DH_MechanicManager_getCameraTrackingLayout_0100 Query layout successful, current layout:' ${layout}`);
        expect(false).assertFail();
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_getCameraTrackingLayout_0100 mechanicManager.off failed, code is ${error.code}, message is ${error.message}`);
        expect(error.code == 33300001||error.code == 33300002).assertTrue();
      }
      console.info("-----------------SUB_DH_MechanicManager_getCameraTrackingLayout_0100 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_enumerated_0100
     * @tc.name       : SUB_DH_MechanicManager_enumerated_0100
     * @tc.desc       : Enumerates the tracking events，TrackingEvent枚举值
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_enumerated_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0100 begin-----------------");
      try {
        let CAMERA_TRACKING_USER_DISABLED = mechanicManager.TrackingEvent.CAMERA_TRACKING_USER_DISABLED
        let CAMERA_TRACKING_USER_ENABLED = mechanicManager.TrackingEvent.CAMERA_TRACKING_USER_ENABLED
        let CAMERA_TRACKING_LAYOUT_CHANGED = mechanicManager.TrackingEvent.CAMERA_TRACKING_LAYOUT_CHANGED
        console.info(`'SUB_DH_MechanicManager_enumerated_0100 CAMERA_TRACKING_USER_DISABLED:' ${CAMERA_TRACKING_USER_DISABLED}`);
        console.info(`'SUB_DH_MechanicManager_enumerated_0100 CAMERA_TRACKING_USER_ENABLED:' ${CAMERA_TRACKING_USER_ENABLED}`);
        console.info(`'SUB_DH_MechanicManager_enumerated_0100 CAMERA_TRACKING_LAYOUT_CHANGED:' ${CAMERA_TRACKING_LAYOUT_CHANGED}`);
        expect(CAMERA_TRACKING_USER_DISABLED).assertEqual(1)
        expect(CAMERA_TRACKING_USER_ENABLED).assertEqual(0)
        expect(CAMERA_TRACKING_LAYOUT_CHANGED).assertEqual(2)
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_enumerated_0100 print failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFalse()
      }
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0100 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_enumerated_0200
     * @tc.name       : SUB_DH_MechanicManager_enumerated_0200
     * @tc.desc       : Enumerates the tracking events,MechDeviceType枚举值
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_enumerated_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0200 begin-----------------");
      try {
        let GIMBAL_DEVICE = mechanicManager.MechDeviceType.GIMBAL_DEVICE
        console.info(`'SUB_DH_MechanicManager_enumerated_0200 GIMBAL_DEVICE:' ${GIMBAL_DEVICE}`);
        expect(GIMBAL_DEVICE).assertEqual(0)
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_enumerated_0200 print failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFalse()
      }
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0200 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_enumerated_0300
     * @tc.name       : SUB_DH_MechanicManager_enumerated_0300
     * @tc.desc       : Enumerates the tracking events,AttachState枚举值
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_enumerated_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0300 begin-----------------");
      try {
        let ATTACHED = mechanicManager.AttachState.ATTACHED
        let DETACHED = mechanicManager.AttachState.DETACHED
        console.info(`'SUB_DH_MechanicManager_enumerated_0300 GIMBAL_DEVICE:' ${ATTACHED}`);
        console.info(`'SUB_DH_MechanicManager_enumerated_0300 GIMBAL_DEVICE:' ${DETACHED}`);
        expect(ATTACHED).assertEqual(0)
        expect(DETACHED).assertEqual(1)
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_enumerated_0300 print failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFalse()
      }
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0300 end-----------------");
    });

    /**
     * @tc.number     : SUB_DH_MechanicManager_enumerated_0400
     * @tc.name       : SUB_DH_MechanicManager_enumerated_0400
     * @tc.desc       : Enumerates the tracking events,CameraTrackingLayout枚举值
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it("SUB_DH_MechanicManager_enumerated_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0400 begin-----------------");
      try {
        let DEFAULT = mechanicManager.CameraTrackingLayout.DEFAULT
        let LEFT = mechanicManager.CameraTrackingLayout.LEFT
        let MIDDLE = mechanicManager.CameraTrackingLayout.MIDDLE
        let RIGHT = mechanicManager.CameraTrackingLayout.RIGHT
        console.info(`'SUB_DH_MechanicManager_enumerated_0400 DEFAULT:' ${DEFAULT}`);
        console.info(`'SUB_DH_MechanicManager_enumerated_0400 LEFT:' ${LEFT}`);
        console.info(`'SUB_DH_MechanicManager_enumerated_0400 MIDDLE:' ${MIDDLE}`);
        console.info(`'SUB_DH_MechanicManager_enumerated_0400 RIGHT:' ${RIGHT}`);
        expect(DEFAULT).assertEqual(0)
        expect(LEFT).assertEqual(1)
        expect(MIDDLE).assertEqual(2)
        expect(RIGHT).assertEqual(3)
      } catch (error) {
        console.error(`SUB_DH_MechanicManager_enumerated_0400 print failed, code is ${error.code}, message is ${error.message}`);
        expect().assertFalse()
      }
      console.info("-----------------SUB_DH_MechanicManager_enumerated_0400 end-----------------");
    });
  })
}