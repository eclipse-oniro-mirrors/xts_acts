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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"
import window from '@ohos.window';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

async function sleep(time: number) {
  let timeoutId: number = 0;
  let promise = new Promise<string>(resolve => {
    timeoutId = setTimeout(() => {
      resolve('sleep finished');
    }, time);
  })
  await promise;
  clearTimeout(timeoutId)
}

export default function windowOrientationTest(context: common.UIAbilityContext, windowStage: window.WindowStage) {
  describe('window_orientation_test', () => {
    console.log('describe window_orientation_test start!!!')
    let tempWnd: window.Window | void;
    let subWin: window.Window | void;

    afterEach(async ()=>{
      if(tempWnd !== null && tempWnd !== undefined){
        await (tempWnd as window.Window).destroyWindow();
      }
      if(subWin !== null && subWin !== undefined){
        await (subWin as window.Window).destroyWindow();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5340
     * @tc.name      : testSetPreferredOrientation_DialogWindow_Promise
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_DialogWindow_Promise', 0, async () => {
      let caseName = 'testSetPreferredOrientation_DialogWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetPreferredOrientation_DialogWindow_Promise",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      let orientation = window.Orientation.AUTO_ROTATION;
      // Calling the interface on a non-primary window succeeded but did not take effect
      try {
        await (tempWnd as window.Window).setPreferredOrientation(orientation).then(() => {
          console.info(msgStr + 'Succeeded in setting the window orientation.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the window orientation. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set window orientation. catch Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5350
     * @tc.name      : testSetPreferredOrientation_DialogWindow_Callback
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_DialogWindow_Callback', 0, async (done: Function) => {
      let caseName = 'testSetPreferredOrientation_DialogWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testSetPreferredOrientation_DialogWindow_Callback",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      expect(!!tempWnd).assertTrue();
      let orientation = window.Orientation.AUTO_ROTATION;
      // Calling the interface on a non-primary window succeeded but did not take effect
      try {
        (tempWnd as window.Window).setPreferredOrientation(orientation, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to set window orientation. Cause code: ${err.code}, message: ${err.message}`);
            await (tempWnd as window.Window).destroyWindow();
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting window orientation.');
          await (tempWnd as window.Window).destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set window orientation. Cause code: ${exception.code}, message: ${exception.message}`);
        await (tempWnd as window.Window).destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5360
     * @tc.name      : testSetPreferredOrientation_SubWindow_Promise
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_SubWindow_Promise', 0, async () => {
      let caseName = 'testSetPreferredOrientation_SubWindow_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetPreferredOrientation_SubWindow_Promise')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      let orientation = window.Orientation.AUTO_ROTATION;
      // Calling the interface on a non-primary window succeeded but did not take effect
      try {
        await (subWin as window.Window).setPreferredOrientation(orientation).then(() => {
          console.info(msgStr + 'Succeeded in setting the window orientation.');
        }).catch((err: BusinessError) => {
          console.error(msgStr + `Failed to set the window orientation. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set window orientation. catch Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (subWin as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5370
     * @tc.name      : testSetPreferredOrientation_SubWindow_Callback
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_SubWindow_Callback', 0, async (done: Function) => {
      let caseName = 'testSetPreferredOrientation_SubWindow_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testSetPreferredOrientation_SubWindow_Callback')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
          done();
        });
      expect(!!subWin).assertTrue();
      let orientation = window.Orientation.AUTO_ROTATION;
      // Calling the interface on a non-primary window succeeded but did not take effect
      try {
        (subWin as window.Window).setPreferredOrientation(orientation, async (err: BusinessError) => {
          const errCode: number = err.code;
          if (errCode) {
            console.error(msgStr + `Failed to set window orientation. Cause code: ${err.code}, message: ${err.message}`);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
            return;
          }
          console.info(msgStr + 'Succeeded in setting window orientation.');
          await (subWin as window.Window).destroyWindow();
          done();
        });
      } catch (exception) {
        console.error(msgStr + `Failed to set window orientation. Cause code: ${exception.code}, message: ${exception.message}`);
        await (subWin as window.Window).destroyWindow();
        expect().assertFail();
        done();
      }
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5380
     * @tc.name      : testGetPreferredOrientation_DialogWindow
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetPreferredOrientation_DialogWindow', 0, async () => {
      let caseName = 'testGetPreferredOrientation_DialogWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let windowConfig: window.Configuration = {
        name: "testGetPreferredOrientation_DialogWindow",
        windowType: window.WindowType.TYPE_DIALOG,
        ctx: context,
      };
      tempWnd = await window.createWindow(windowConfig).catch((err: BusinessError) => {
        console.log(msgStr + 'window.createWindow ' + 'catched, err: ' + JSON.stringify(err));
        expect().assertFail();
      });
      expect(!!tempWnd).assertTrue();
      // Calling the interface on a non-primary window succeeded but did not take effect
      try {
        let orientation = (tempWnd as window.Window).getPreferredOrientation();
        console.info(msgStr + `successed to get window orientation: ${orientation}`);
      } catch (exception) {
        console.error(msgStr + `Failed to set window orientation. catch Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (tempWnd as window.Window).destroyWindow();
    })
    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5390
     * @tc.name      : testGetPreferredOrientation_SubWindow
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetPreferredOrientation_SubWindow', 0, async () => {
      let caseName = 'testGetPreferredOrientation_SubWindow';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      subWin = await windowStage.createSubWindow('testGetPreferredOrientation_SubWindow')
        .catch((err: BusinessError) => {
          console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect().assertFail();
        });
      expect(!!subWin).assertTrue();
      // Calling the interface on a non-primary window succeeded but did not take effect
      try {
        let orientation = (subWin as window.Window).getPreferredOrientation();
        console.info(msgStr + `successed to get window orientation: ${orientation}`);
      } catch (exception) {
        console.error(msgStr + `Failed to set window orientation. catch Cause code: ${exception.code}, message: ${exception.message}`);
        expect().assertFail();
      }
      await (subWin as window.Window).destroyWindow();
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5650
     * @tc.name      : testSetPreferredOrientation_SubWindowWithOptions_Promise
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_SubWindowWithOptions_Promise', 0, async () => {
      let caseName = 'testSetPreferredOrientation_SubWindowWithOptions_Promise';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'SetPreOrie_SubWinOpt',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetPreferredOrientation_SubWindowWithOptions_Promise', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          let orientation = window.Orientation.AUTO_ROTATION;
          // Calling the interface on a non-primary window succeeded but did not take effect
          try {
            await (subWin as window.Window).setPreferredOrientation(orientation).then(() => {
              console.info(msgStr + 'Succeeded in setting the window orientation.');
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set the window orientation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set window orientation. catch Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          }
          await (subWin as window.Window).destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
          }
        });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5660
     * @tc.name      : testSetPreferredOrientation_SubWindowWithOptions_Callback
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testSetPreferredOrientation_SubWindowWithOptions_Callback', 0, async (done: Function) => {
      let caseName = 'testSetPreferredOrientation_SubWindowWithOptions_Callback';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'SetPreOrie_SubWinOpt',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testSetPreferredOrientation_SubWindowWithOptions_Callback', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          let orientation = window.Orientation.AUTO_ROTATION;
          // Calling the interface on a non-primary window succeeded but did not take effect
          try {
            (subWin as window.Window).setPreferredOrientation(orientation, async (err: BusinessError) => {
              const errCode: number = err.code;
              if (errCode) {
                console.error(msgStr + `Failed to set window orientation. Cause code: ${err.code}, message: ${err.message}`);
                await (subWin as window.Window).destroyWindow();
                expect().assertFail();
                done();
                return;
              }
              console.info(msgStr + 'Succeeded in setting window orientation.');
              await (subWin as window.Window).destroyWindow();
              done();
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set window orientation. Cause code: ${exception.code}, message: ${exception.message}`);
            await (subWin as window.Window).destroyWindow();
            expect().assertFail();
            done();
          }
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
            done();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
            done();
          }
        });
    })

    /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5670
     * @tc.name      : testGetPreferredOrientation_SubWindowWithOptions
     * @tc.desc      : Verify the scenario of creating the application type window
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level3
     */
    it('testGetPreferredOrientation_SubWindowWithOptions', 0, async () => {
      let caseName = 'testGetPreferredOrientation_SubWindowWithOptions';
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin');
      let options: window.SubWindowOptions = {
        title: 'SetPreOrie_SubWinOpt',
        decorEnabled: true
      };
      await windowStage.createSubWindowWithOptions('testGetPreferredOrientation_SubWindowWithOptions', options)
        .then(async (data) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          let orientation = window.Orientation.AUTO_ROTATION;
          // Calling the interface on a non-primary window succeeded but did not take effect
          try {
            await (subWin as window.Window).setPreferredOrientation(orientation).then(() => {
              console.info(msgStr + 'Succeeded in setting the window orientation.');
            }).catch((err: BusinessError) => {
              console.error(msgStr + `Failed to set the window orientation. Cause code: ${err.code}, message: ${err.message}`);
              expect().assertFail();
            });
          } catch (exception) {
            console.error(msgStr + `Failed to set window orientation. catch Cause code: ${exception.code}, message: ${exception.message}`);
            expect().assertFail();
          }
          await (subWin as window.Window).destroyWindow();
        })
        .catch((err: BusinessError) => {
          if (err.code != 1300002) {
            console.error(msgStr + `Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
          } else {
            console.log(msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
            console.log(msgStr + JSON.stringify(err))
            expect(err.code).assertEqual(1300002);
          }
        });
    })
  })
}
