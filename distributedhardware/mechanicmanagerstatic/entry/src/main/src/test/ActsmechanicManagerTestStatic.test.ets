/**
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
import { describe, beforeAll, Hypium, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import mechanicManager from '@ohos.distributedHardware.mechanicManager'

let domain: int = 0x0000; //日志标识,domain作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为


export default function ActsmechanicManagerTestStatic() {
  describe('ActsmechanicManagerTestStatic', () => {
    hilog.info(domain, tag, "====>start describe ActsMultimechanicManagerTestStatic");

    beforeAll(async (done: () => void): Promise<void> => {
      hilog.info(domain, tag, '%{public}s', '====>beforeAll start');
      done();
    })

    /**
     * @tc.name   SUB_DH_MechanicManager_on_AttachStateChange_0100
     * @tc.number SUB_DH_MechanicManager_on_AttachStateChange_0100
     * @tc.desc   Subscribes to device attachment state change events,on_AttachStateChange接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_on_AttachStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_on_AttachStateChange_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          hilog.info(domain, tag, '注册连接状态变化事件的回调监听');
          mechanicManager.onAttachStateChange((result: mechanicManager.AttachStateChangeInfo) => {
            hilog.info(domain, tag, `'result:' ${result}`);
          });
          hilog.info(domain, tag, '注册连接状态变化事件的回调监听成功');
          expect(flag == 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', '注册连接状态变化事件的回调监听失败 failed for ' + err);
          const e = err as BusinessError;
          hilog.info(domain, tag, `onAttachStateChange failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_off_AttachStateChange_0100
     * @tc.number SUB_DH_MechanicManager_off_AttachStateChange_0100
     * @tc.desc   Subscribes to device attachment state change events,off_AttachStateChange接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_off_AttachStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_off_AttachStateChange_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          hilog.info(domain, tag, '去注册连接状态变化事件的回调监听');
          mechanicManager.offAttachStateChange((result: mechanicManager.AttachStateChangeInfo) => {
            hilog.info(domain, tag, `'result:' ${result}`);
          });
          hilog.info(domain, tag, '去注册连接状态变化事件的回调监听成功');
          expect(flag == 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, "====>去注册连接状态变化事件的回调监听失败 err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `offAttachStateChange failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_off_AttachStateChange_0200
     * @tc.number SUB_DH_MechanicManager_off_AttachStateChange_0200
     * @tc.desc   Subscribes to device attachment state change events,off_AttachStateChange接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_off_AttachStateChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_off_AttachStateChange_0200`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          hilog.info(domain, tag, '去注册连接状态变化事件的回调监听');
          mechanicManager.offAttachStateChange();
          hilog.info(domain, tag, '去注册连接状态变化事件的回调监听成功');
          expect(flag == 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, "====>去注册连接状态变化事件的回调监听失败 err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `offAttachStateChange failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_getAttachedMechDevices_0100
     * @tc.number SUB_DH_MechanicManager_getAttachedMechDevices_0100
     * @tc.desc   Obtain the list of connected mechanical devices,getAttachedMechDevices接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_getAttachedMechDevices_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_getAttachedMechDevices_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        try {
          let mechInfos: mechanicManager.MechInfo[] = mechanicManager.getAttachedMechDevices();
          hilog.info(domain, tag, '设备列表:' + JSON.stringify(mechInfos));
          expect(mechInfos[0].mechId == 0).assertTrue();
          expect(mechInfos[0].mechDeviceType == 0).assertTrue();
          expect(mechInfos[0].mechName != null).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, "====>查询设备列表失败 err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `查询设备列表失败 failed err.code: ${e.code}`);
          expect(e.code == 33300001).assertTrue()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_setCameraTrackingEnabled_0100
     * @tc.number SUB_DH_MechanicManager_setCameraTrackingEnabled_0100
     * @tc.desc   Enables or disables camera tracking,setCameraTrackingEnabled接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_setCameraTrackingEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_setCameraTrackingEnabled_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          mechanicManager.setCameraTrackingEnabled(true);
          hilog.info(domain, tag, 'Enable Tracking Success');
          expect(flag == 0).assertFail();
        } catch (err) {
          hilog.info(domain, tag, "====>setCameraTrackingEnabled err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `setCameraTrackingEnabled err.code: ${e.code}`);
          expect(e.code == 33300001 || e.code == 33300002 || e.code == 33300003).assertTrue()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_setCameraTrackingEnabled_0200
     * @tc.number SUB_DH_MechanicManager_setCameraTrackingEnabled_0200
     * @tc.desc   Enables or disables camera tracking,setCameraTrackingEnabled接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_setCameraTrackingEnabled_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_setCameraTrackingEnabled_0200`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          mechanicManager.setCameraTrackingEnabled(false);
          hilog.info(domain, tag, 'Enable Tracking Success');
          expect(flag == 0).assertFail();
        } catch (err) {
          hilog.info(domain, tag, "====>setCameraTrackingEnabled err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `setCameraTrackingEnabled err.code: ${e.code}`);
          expect(e.code == 33300001 || e.code == 33300002 || e.code == 33300003).assertTrue()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_getCameraTrackingEnabled_0100
     * @tc.number SUB_DH_MechanicManager_getCameraTrackingEnabled_0100
     * @tc.desc   Enables or disables camera tracking,getCameraTrackingEnabled接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_getCameraTrackingEnabled_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_getCameraTrackingEnabled_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          let enabled = mechanicManager.getCameraTrackingEnabled();
          hilog.info(domain, tag, `'current tracking status:' ${enabled}`);
          expect(flag == 0).assertFail();
        } catch (err) {
          hilog.info(domain, tag, "====>getCameraTrackingEnabled err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `getCameraTrackingEnabled err.code: ${e.code}`);
          expect(e.code == 33300001 || e.code == 33300002).assertTrue()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_onTrackingStateChange_0100
     * @tc.number SUB_DH_MechanicManager_onTrackingStateChange_0100
     * @tc.desc   Register a callback listener for tracking status changes,onTrackingStateChange接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_onTrackingStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_onTrackingStateChange_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          hilog.info(domain, tag, '注册跟踪事件监听');
          mechanicManager.onTrackingStateChange((result: mechanicManager.TrackingEventInfo) => {
            hilog.info(domain, tag, `'result:' ${result}`);
          });
          hilog.info(domain, tag, '注册跟踪事件监听成功');
          expect(flag == 0).assertFail();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', '注册跟踪事件监听失败 failed for ' + err);
          const e = err as BusinessError;
          hilog.info(domain, tag, `onTrackingStateChange failed err.code: ${e.code}`);
          expect(e.code == 33300001).assertTrue()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_offTrackingStateChange_0100
     * @tc.number SUB_DH_MechanicManager_offTrackingStateChange_0100
     * @tc.desc   Register a callback listener for tracking status changes,offTrackingStateChange接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_offTrackingStateChange_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_offTrackingStateChange_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          hilog.info(domain, tag, '去注册跟踪事件监听');
          mechanicManager.offTrackingStateChange((result: mechanicManager.TrackingEventInfo) => {
            hilog.info(domain, tag, `'result:' ${result}`);
          });
          hilog.info(domain, tag, '去注册跟踪事件监听成功');
          expect(flag == 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', '去注册跟踪事件监听失败 failed for ' + err);
          const e = err as BusinessError;
          hilog.info(domain, tag, `offTrackingStateChange failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
   * @tc.name   SUB_DH_MechanicManager_offTrackingStateChange_0200
   * @tc.number SUB_DH_MechanicManager_offTrackingStateChange_0200
   * @tc.desc   Register a callback listener for tracking status changes,offTrackingStateChange接口调用
   * @tc.type   FUNCTION
   * @tc.size   MEDIUMTEST
   * @tc.level  LEVEL3
   */
    it('SUB_DH_MechanicManager_offTrackingStateChange_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_offTrackingStateChange_0200`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          hilog.info(domain, tag, '去注册跟踪事件监听');
          mechanicManager.offTrackingStateChange();
          hilog.info(domain, tag, '去注册跟踪事件监听成功');
          expect(flag == 0).assertTrue();
        } catch (err) {
          hilog.info(domain, tag, '%{public}s', '去注册跟踪事件监听失败 failed for ' + err);
          const e = err as BusinessError;
          hilog.info(domain, tag, `offTrackingStateChange failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_getCameraTrackingLayout_0100
     * @tc.number SUB_DH_MechanicManager_getCameraTrackingLayout_0100
     * @tc.desc   Obtains the camera tracking layout of the current robot device,getCameraTrackingLayout接口调用
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_getCameraTrackingLayout_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_getCameraTrackingLayout_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        let flag = 0;
        try {
          let layout = mechanicManager.getCameraTrackingLayout();
          hilog.info(domain, tag, `'Query layout successful, current layout:' ${layout}`);
          expect(flag == 0).assertFail();
        } catch (err) {
          hilog.info(domain, tag, "====>getCameraTrackingLayout err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `getCameraTrackingLayout err.code: ${e.code}`);
          expect(e.code == 33300001 || e.code == 33300002).assertTrue()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_enumerated_0100
     * @tc.number SUB_DH_MechanicManager_enumerated_0100
     * @tc.desc   Enumerates the tracking events,TrackingEvent枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_enumerated_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_enumerated_0100`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        try {
          let CAMERA_TRACKING_USER_DISABLED = mechanicManager.TrackingEvent.CAMERA_TRACKING_USER_DISABLED;
          let CAMERA_TRACKING_USER_ENABLED = mechanicManager.TrackingEvent.CAMERA_TRACKING_USER_ENABLED;
          let CAMERA_TRACKING_LAYOUT_CHANGED = mechanicManager.TrackingEvent.CAMERA_TRACKING_LAYOUT_CHANGED;
          hilog.info(domain, tag, `'CAMERA_TRACKING_USER_DISABLED:' ${CAMERA_TRACKING_USER_DISABLED}`);
          hilog.info(domain, tag, `'CAMERA_TRACKING_USER_ENABLED:' ${CAMERA_TRACKING_USER_ENABLED}`);
          hilog.info(domain, tag, `'CAMERA_TRACKING_LAYOUT_CHANGED:' ${CAMERA_TRACKING_LAYOUT_CHANGED}`);
          expect(CAMERA_TRACKING_USER_DISABLED).assertEqual(1);
          expect(CAMERA_TRACKING_USER_ENABLED).assertEqual(0);
          expect(CAMERA_TRACKING_LAYOUT_CHANGED).assertEqual(2);
        } catch (err) {
          hilog.info(domain, tag, "====>Enumeration value print failed err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `Enumeration value print failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_enumerated_0200
     * @tc.number SUB_DH_MechanicManager_enumerated_0200
     * @tc.desc   Enumerates the tracking events,MechDeviceType枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_enumerated_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_enumerated_0200`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        try {
          let GIMBAL_DEVICE = mechanicManager.MechDeviceType.GIMBAL_DEVICE;
          hilog.info(domain, tag, `'GIMBAL_DEVICE:' ${GIMBAL_DEVICE}`);
          expect(GIMBAL_DEVICE).assertEqual(0);
        } catch (err) {
          hilog.info(domain, tag, "====>Enumeration value print failed err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `Enumeration value print failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_enumerated_0300
     * @tc.number SUB_DH_MechanicManager_enumerated_0300
     * @tc.desc   Enumerates the tracking events,AttachState枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_enumerated_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_enumerated_0300`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        try {
          let ATTACHED = mechanicManager.AttachState.ATTACHED;
          let DETACHED = mechanicManager.AttachState.DETACHED;
          hilog.info(domain, tag, `' ATTACHED:' ${ATTACHED}`);
          hilog.info(domain, tag, `' DETACHED:' ${DETACHED}`);
          expect(ATTACHED).assertEqual(0);
          expect(DETACHED).assertEqual(1);
        } catch (err) {
          hilog.info(domain, tag, "====>Enumeration value print failed err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `Enumeration value print failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });

    /**
     * @tc.name   SUB_DH_MechanicManager_enumerated_0400
     * @tc.number SUB_DH_MechanicManager_enumerated_0400
     * @tc.desc   Enumerates the tracking events,CameraTrackingLayout枚举值
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SUB_DH_MechanicManager_enumerated_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        const LOG_NAME = `SUB_DH_MechanicManager_enumerated_0400`;
        hilog.info(domain, tag, `======>${LOG_NAME} begin======`);
        try {
          let DEFAULT = mechanicManager.CameraTrackingLayout.DEFAULT;
          let LEFT = mechanicManager.CameraTrackingLayout.LEFT;
          let MIDDLE = mechanicManager.CameraTrackingLayout.MIDDLE;
          let RIGHT = mechanicManager.CameraTrackingLayout.RIGHT;
          console.info(domain, tag, `'DEFAULT:' ${DEFAULT}`);
          console.info(domain, tag, `'LEFT:' ${LEFT}`);
          console.info(domain, tag, `'MIDDLE:' ${MIDDLE}`);
          console.info(domain, tag, `'RIGHT:' ${RIGHT}`);
          expect(DEFAULT).assertEqual(0);
          expect(LEFT).assertEqual(1);
          expect(MIDDLE).assertEqual(2);
          expect(RIGHT).assertEqual(3);
        } catch (err) {
          hilog.info(domain, tag, "====>Enumeration value print failed err:" + JSON.stringify(err));
          const e = err as BusinessError;
          hilog.info(domain, tag, `Enumeration value print failed err.code: ${e.code}`);
          expect().assertFail()
        }
        hilog.info(domain, tag, `======>${LOG_NAME} end======`);
        done();
      });
  })
}