/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium';
import intelligentScene from '@ohos.intelligentScene';
import settings from '@ohos.settings';
import { BusinessError } from '@ohos.base';
import { bundleManager } from '@kit.AbilityKit';
import { mContext } from '../testability/TestAbility';

interface myObj {
  "bundle": string,
  "uid": number,
  "appIndex": number
}

function sleep(numberMillis: number) {
  let now = new Date();
  let exitTime = now.getTime() + numberMillis;
  while (true) {
    if (new Date().getTime() > exitTime) {
      return;
    }
  }
}

export default function intelligentSceneJsunit() {
  describe('IntelligentSceneTest', () => {
    console.log("************* IntelligentSceneTest Test start*************");
    let defaultState: string = '';
    let defaultAllowData: string = '';

    beforeAll(() => {
      // 获取初始数据
      defaultState = settings.getValueSync(mContext, 'focus_mode_enable', '', settings.domainName.USER_SECURITY);
      defaultAllowData = settings.getValueSync(mContext, 'intelligent_scene_notification_white_list', '',
        settings.domainName.USER_SECURITY);
    });

    afterAll(() => {
      // 恢复初始数据
      settings.setValueSync(mContext, 'focus_mode_enable', defaultState, settings.domainName.USER_SECURITY);
      settings.setValueSync(mContext, 'intelligent_scene_notification_white_list', defaultAllowData,
        settings.domainName.USER_SECURITY);
    })

    /**
     * @tc.name   Test_isDoNotDisturbEnabled_002
     * @tc.number SUB_Applications_IntelligentScene_IsDoNotDisturbEnabled_002
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_isDoNotDisturbEnabled_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          settings.setValueSync(mContext, 'focus_mode_enable', '1', settings.domainName.USER_SECURITY);
          sleep(300);
          intelligentScene.isDoNotDisturbEnabled().then((res: boolean) => {
            expect(res).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`isDoNotDisturbEnabled error, Code is ${err?.code}, message is ${err?.message}`);
            // 接口内部异常
            expect(err?.code).assertEqual(35200001);
            done();
          });
        } catch (error) {
          console.error(`isDoNotDisturbEnabled catch error, Code is ${error?.code}, message is ${error?.message}`);
          // 接口内部异常
          expect(error?.code).assertEqual(35200001);
          done();
        }
      });

    /**
     * @tc.name   Test_isDoNotDisturbEnabled_003
     * @tc.number SUB_Applications_IntelligentScene_IsDoNotDisturbEnabled_003
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_isDoNotDisturbEnabled_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          sleep(300);
          settings.setValueSync(mContext, 'focus_mode_enable', '0', settings.domainName.USER_SECURITY);
          sleep(300);
          intelligentScene.isDoNotDisturbEnabled().then((res: boolean) => {
            expect(res).assertFalse();
            done();
          }).catch((err: BusinessError) => {
            console.error(`isDoNotDisturbEnabled error, Code is ${err?.code}, message is ${err?.message}`);
            // 接口内部异常
            expect(err?.code).assertEqual(35200001);
            done();
          });
        } catch (error) {
          console.error(`isDoNotDisturbEnabled catch error, Code is ${error?.code}, message is ${error?.message}`);
          // 接口内部异常
          expect(error?.code).assertEqual(35200001);
          done();
        }
      });

    /**
     * @tc.name   Test_isNotifyAllowedInDoNotDisturb_002
     * @tc.number SUB_Applications_IntelligentScene_IsNotifyAllowedInDoNotDisturb_002
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_isNotifyAllowedInDoNotDisturb_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          sleep(300);
          settings.setValueSync(mContext, 'focus_mode_enable', '0', settings.domainName.USER_SECURITY);
          sleep(300);
          intelligentScene.isNotifyAllowedInDoNotDisturb().then((res: boolean) => {
            expect(res).assertFalse();
            done();
          }).catch((err: BusinessError) => {
            console.error(`isNotifyAllowedInDoNotDisturb error, Code is ${err?.code}, message is ${err?.message}`);
            // 接口内部异常
            expect(err?.code).assertEqual(35200001);
            done();
          });
        } catch (error) {
          console.error(`isNotifyAllowedInDoNotDisturb catch error, Code is ${error?.code}, message is ${error?.message}`);
          // 接口内部异常
          expect(error?.code).assertEqual(35200001);
          done();
        }
      });


    /**
     * @tc.name   Test_isNotifyAllowedInDoNotDisturb_003
     * @tc.number SUB_Applications_IntelligentScene_IsNotifyAllowedInDoNotDisturb_003
     * @tc.desc   MediumTest
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Test_isNotifyAllowedInDoNotDisturb_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        try {
          sleep(300);
          settings.setValueSync(mContext, 'focus_mode_enable', '1', settings.domainName.USER_SECURITY);
          const info: bundleManager.BundleInfo =
            await bundleManager.getBundleInfoForSelf(bundleManager.BundleFlag.GET_BUNDLE_INFO_WITH_APPLICATION);
          let appInfo: myObj[] = [];
          appInfo.push({
            "bundle": info.appInfo.name,
            "uid": info.appInfo.uid,
            "appIndex": 0,
          });
          settings.setValueSync(mContext, 'intelligent_scene_notification_white_list', JSON.stringify(appInfo),
            settings.domainName.USER_SECURITY);

          sleep(300);
          intelligentScene.isNotifyAllowedInDoNotDisturb().then((res: boolean) => {
            expect(res).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(`isNotifyAllowedInDoNotDisturb error, Code is ${err?.code}, message is ${err?.message}`);
            // 接口内部异常
            expect(err?.code).assertEqual(35200001);
            done();
          });
        } catch (error) {
          console.error(`isNotifyAllowedInDoNotDisturb catch error, Code is ${error?.code}, message is ${error?.message}`);
          // 接口内部异常
          expect(error?.code).assertEqual(35200001);
          done();
        }
      });
  });
}