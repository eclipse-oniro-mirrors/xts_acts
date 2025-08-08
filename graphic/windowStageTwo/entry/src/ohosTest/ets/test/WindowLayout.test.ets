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
import hilog from '@ohos.hilog';
import window from '@ohos.window';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , TestType, Size, Level} from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import { Driver, ON } from '@kit.TestKit';
import settings from '@ohos.settings';

export default function windowLayoutTest() {
  describe('windowLayoutTest', async () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isAutoWindow: string = '';
    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
    });
    beforeEach(() => {
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    

        /**
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0100
     * @tc.name       : test_setFollowParentMultiScreenPolicy_401
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_401
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setFollowParentMultiScreenPolicy_401', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_401";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_setFollowParentMultiScreenPolicy_401');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(null);
        promise.then(() => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            done()
          }else{
            expect(true).assertFail();
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
        expect(e.code).assertEqual(401);
        done()

      }

    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0200
     * @tc.name       : test_setFollowParentMultiScreenPolicy_1300002
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_1300002
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setFollowParentMultiScreenPolicy_1300002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_1300002";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_setFollowParentMultiScreenPolicy_1300002');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        await subWindow.destroyWindow();
        let promise = subWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(() => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done()
          }else{
            expect(err.code).assertEqual(1300002);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
        expect(true).assertFail();
        done()
      }

    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0300
     * @tc.name       : test_setFollowParentMultiScreenPolicy_mainWindow_1300004
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_mainWindow_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setFollowParentMultiScreenPolicy_mainWindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_mainWindow_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let mainWindow = windowStage.getMainWindowSync();
      try {
        let promise = mainWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(() => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          if(err.code == 801){
            done()
          }else{
            expect(err.code).assertEqual(1300004);
            done()
          }
          
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        expect(true).assertFail();
        done()

      }

    })

    /**
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0400
     * @tc.name       : test_setFollowParentMultiScreenPolicy_dialogWindow_1300004
     * @tc.desc       : test_setFollowParentMultiScreenPolicy_dialogWindow_1300004
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 3
     */
    it('test_setFollowParentMultiScreenPolicy_dialogWindow_1300004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let caseName = "test_setFollowParentMultiScreenPolicy_dialogWindow_1300004";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let config: window.Configuration = {
        name: "test_setFollowParentMultiScreenPolicy_dialogWindow_1300004",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context
      };
      let windowClass = await window.createWindow(config);
      try {
        let promise = windowClass.setFollowParentMultiScreenPolicy(true);
        promise.then(() => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          expect(true).assertFail();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await windowClass.destroyWindow();
          if(err.code == 801){
            done()
          }else{
            expect(err.code).assertEqual(1300004);
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await windowClass.destroyWindow();
        expect(true).assertFail();
        done()

      }

    })

    /**
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0500
     * @tc.name       : test_subWindow_setFollowParentMultiScreenPolicy_true
     * @tc.desc       : test_subWindow_setFollowParentMultiScreenPolicy_true
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_subWindow_setFollowParentMultiScreenPolicy_true', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_subWindow_setFollowParentMultiScreenPolicy_true";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_subWindow_setFollowParentMultiScreenPolicy_true');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(true);
        promise.then(async () => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          await subWindow.destroyWindow();
          expect(true).assertTrue();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            done()
          }else{
            expect(true).assertFail();
            done()
          }
          
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
          expect(true).assertFail();
          done()

      }

    })
    /**
     * @tc.number     : SUB_BASIC_WMS_SetFollowParentMultiScreenPolicy_0600
     * @tc.name       : test_subWindow_setFollowParentMultiScreenPolicy_false
     * @tc.desc       : test_subWindow_setFollowParentMultiScreenPolicy_false
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 2
     */
    it('test_subWindow_setFollowParentMultiScreenPolicy_false', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let caseName = "test_subWindow_setFollowParentMultiScreenPolicy_false";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      let subWindow = await windowStage.createSubWindow('test_subWindow_setFollowParentMultiScreenPolicy_false');
      await subWindow.setUIContent('testability/pages/First/index2');
      await subWindow.showWindow();
      try {
        let promise = subWindow.setFollowParentMultiScreenPolicy(false);
        promise.then(async () => {
          console.info(msgStr +'Succeeded  setFollowParentMultiScreenPolicy.');
          await subWindow.destroyWindow();
          expect(true).assertTrue();
          done()
        }).catch(async (err: BusinessError) => {
          console.error(msgStr +`Failed to setFollowParentMultiScreenPolicy . Cause code: ${err.code}, message: ${err.message}`);
          await subWindow.destroyWindow();
          if(err.code == 801){
            done()
          }else{
            expect(true).assertFail();
            done()
          }
        });
      } catch (e) {
        console.log(msgStr + ' ' + 'catched, err: ' + JSON.stringify(e.code));
        await subWindow.destroyWindow();
        expect(true).assertFail();
        done()

      }

    })

  })
}