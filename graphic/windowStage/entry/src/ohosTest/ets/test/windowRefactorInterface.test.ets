/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';


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

export default function windowRefactorInterfaceTest(context: common.UIAbilityContext, windowStage: ohosWindow.WindowStage) {
  describe('windowRefactorInterface_test', () => {
    console.info('describe window_api_test2 start!!!')
    const TRUE_FLAG = true;
    let commonRGBColorArr: Array<string> = ['rgb(255,0,0)', 'rgb(0,255,0)', 'rgb(0,0,255)', 'rgb(255,255,255)', 'rgb(0,0,0)', 'rgb(249,0,230)', 'rgb(102,102,102)', 'rgb(255,247,0)'];
    let commonNUMBERColorArr: Array<string> = ['#00FF0000', '#0000FF00', '#000000FF', '#00FFFFFF', '#00000000', '#00F900E6', '#00666666', '#00FFF700'];
    let commonKEYColorArr: Array<string> = ['red', 'green', 'blue', 'white', 'black', 'pink', 'grey', 'yellow'];

    /**
     * @tc.name   testSetWindowSystemBarProperties_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2020
     * @tc.desc   Verify the scene where the colors of the status bar and navigation bar are set in RGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowSystemBarProperties_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName = 'testSetWindowSystemBarProperties_Callback';
      let msgStr = 'jsUnittest ' + caseName + ' ';
      let mainWsync: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(mainWsync != null).assertTrue();
      await mainWsync.showWindow().catch((err: BusinessError) => {
        console.info('setWindowSystemBarPropertiesTest1  mainWsync.showWindow() error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await mainWsync.setWindowSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        console.info('setWindowSystemBarPropertiesTest1  mainWsync.setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      for (let i = 0; i < commonRGBColorArr.length; i++) {
        console.info('setWindowSystemBarPropertiesTest1 begin step:' + i);
        let tempColor: string = commonRGBColorArr[i];
        let systemBarProperties: ohosWindow.SystemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationBarContentColor: tempColor,
        };
        await mainWsync.setWindowSystemBarProperties(systemBarProperties).then(() => {
          console.info('setWindowSystemBarPropertiesTest1 success step:' + i);
          expect(TRUE_FLAG).assertTrue();
          if (i == commonRGBColorArr.length - 1) {
            console.info('setWindowSystemBarPropertiesTest1 finished step:' + i);
            done()
          }
        }).catch((err: BusinessError) => {
          console.info('setWindowSystemBarPropertiesTest1  error : ' + JSON.stringify(err));
          if (err.code == 801) {
            expect(TRUE_FLAG).assertTrue();
          } else {
            expect().assertFail()
          }
          done();
        })
      }
    })

    /**
     * @tc.name   testSetWindowSystemBarProperties_IsNavigationBarLightIcon_True
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2000
     * @tc.desc   Verify the scene where the status bar and navigation bar colors are set in hexadecimal form
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowSystemBarProperties_IsNavigationBarLightIcon_True', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName = 'testSetWindowSystemBarProperties_IsNavigationBarLightIcon_True';
      let mainWsync: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(mainWsync != null).assertTrue();
      await mainWsync.showWindow().catch((err: BusinessError) => {
        console.info('setWindowSystemBarPropertiesTest2  mainWsync.showWindow() error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });

      await mainWsync.setWindowSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        console.info('setWindowSystemBarPropertiesTest2  mainWsync.setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      for (let i = 0; i < commonNUMBERColorArr.length; i++) {
        console.info('setWindowSystemBarPropertiesTest2 begin step:' + i);
        let tempColor = commonNUMBERColorArr[i];
        let systemBarProperties: ohosWindow.SystemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: true,
          navigationBarContentColor: tempColor,
        };
        await mainWsync.setWindowSystemBarProperties(systemBarProperties).then(() => {
          console.info('setWindowSystemBarPropertiesTest2 success step:' + i);
          expect(TRUE_FLAG).assertTrue();
          if (i == commonNUMBERColorArr.length - 1) {
            console.info('setWindowSystemBarPropertiesTest2 finished step:' + i);
            done();
          }
        }).catch((err: BusinessError) => {
          console.info('setWindowSystemBarPropertiesTest2  error : ' + JSON.stringify(err));
          if (err.code == 801) {
            expect(TRUE_FLAG).assertTrue();
          } else {
            expect().assertFail()
          }
          done();
        })
      }
    })

    /**
     * @tc.name   testSetWindowSystemBarProperties_SetColor_By_Name
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2010
     * @tc.desc   Verify the scene where the status bar and navigation bar colors are set as keywords
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowSystemBarProperties_SetColor_By_Name', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let caseName = 'testSetWindowSystemBarProperties_SetColor_By_Name';
      let tempWnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(tempWnd != null).assertTrue();
      await tempWnd.showWindow().catch((err: BusinessError) => {
        console.info('setWindowSystemBarPropertiesTest3  mainWsync.showWindow() error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      await tempWnd.setWindowSystemBarEnable(['status', 'navigation']).catch((err: BusinessError) => {
        console.info('setWindowSystemBarPropertiesTest3  mainWsync.setWindowSystemBarEnable error : ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      for (let i = 0; i < commonKEYColorArr.length; i++) {
        console.info('setWindowSystemBarPropertiesTest3 begin step:' + i);
        let tempColor = commonKEYColorArr[i];
        let systemBarProperties: ohosWindow.SystemBarProperties = {
          statusBarColor: tempColor,
          isStatusBarLightIcon: true,
          statusBarContentColor: tempColor,
          navigationBarColor: tempColor,
          isNavigationBarLightIcon: false,
          navigationBarContentColor: tempColor,
        };
        await tempWnd.setWindowSystemBarProperties(systemBarProperties).then(() => {
          console.info('setWindowSystemBarPropertiesTest3 success step:' + i);
          expect(TRUE_FLAG).assertTrue();
          if (i == commonKEYColorArr.length - 1) {
            console.info('setWindowSystemBarPropertiesTest3 finished step:' + i);
            done();
          }
        }).catch((err: BusinessError) => {
          console.info('setWindowSystemBarPropertiesTest3  error : ' + JSON.stringify(err));
          if (err.code == 801) {
            expect(TRUE_FLAG).assertTrue();
          } else {
            expect().assertFail()
          }
          done();
        })
      }
    })

    /**
     * @tc.name   testSetWindowSystemBarProperties_SetColor_By_RGB
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1990
     * @tc.desc   Verify the scene where the status bar and navigation bar colors are set as keywords
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowSystemBarProperties_SetColor_By_RGB', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let SystemBarProperties: ohosWindow.SystemBarProperties = {
        statusBarColor: '#ff00ff',
        navigationBarColor: '#00ff00',
        isStatusBarLightIcon: true,
        isNavigationBarLightIcon: false,
        statusBarContentColor: '#ffffff',
        navigationBarContentColor: '#00ffff'
      };
      let tempWnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(tempWnd != null).assertTrue();
      try {
        tempWnd.setWindowSystemBarProperties(SystemBarProperties, (err: BusinessError) => {
          console.info('Succeeded in setting the system bar properties.' + JSON.stringify(err));
          if (err.code && err.code !== 801) {
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`tempWnd.setWindowSystemBarProperties catch error: ${JSON.stringify(error)}`)
            }
            done()
          } else if (err.code && err.code == 801) {
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setWindowSystemBarProperties catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('Succeeded in setting the system bar properties.');
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (error) {
              console.info(`tempWnd.setWindowSystemBarProperties catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the system bar properties. Cause: ' + JSON.stringify(exception));
        if (exception.code && exception.code == 801) {
          expect(TRUE_FLAG).assertTrue();
          done()
        } else {
          expect(exception.code).assertEqual(401);
          done()
        }
      }
      ;
    })

    /**
     * @tc.name   testSetUIContent_Existence_page
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1410
     * @tc.desc   Verify the scenario of loading an existing page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetUIContent_Existence_page', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      let win: ohosWindow.Window | void;
      let msgStr = "testSetUIContent_Existence_page";
      try {
        win = await windowStage.createSubWindow('testSetUIContent_Existence_page').catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(win != null);
        await (win as ohosWindow.Window).setUIContent('testability/pages/second/second').then(async () => {
          console.info('setUIContent1 . Cause: success');
          await (win as ohosWindow.Window).destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error('Failed to setUIContent . Cause:' + JSON.stringify(err));
          await (win as ohosWindow.Window).destroyWindow();
          expect().assertFail();
          done();
        });
      } catch (exception) {
        console.error('Failed to create the window. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetUIContentTestCallback1
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1400
     * @tc.desc   Verify the scenario of loading an existing page
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetUIContentTestCallback1', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testSetUIContentTestCallback1'
      let winData: ohosWindow.Window | void;
      winData = await windowStage.createSubWindow('testSetUIContentTestCallback1').catch((err: BusinessError) => {
        console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      });
      console.log(msgStr + 'windowStage.createSubWindow success');
      expect(!!winData).assertTrue();
      try {
        (winData as ohosWindow.Window).setUIContent('pages/second/second', async (err: BusinessError) => {
          try {
            if (err.code) {
              console.error('Failed to load the content callback. Cause:' + JSON.stringify(err));
              await (winData as ohosWindow.Window).destroyWindow();
              expect(err.code).assertEqual(401);
              done();
            } else {
              console.info('Succeeded in loading the content.');
              await (winData as ohosWindow.Window).destroyWindow();
              expect().assertFail();
              done();
            }
          } catch (err) {
            console.log('setUIContentTestCallBack1 assert result catch' + JSON.stringify(err));
          }
        });
      } catch (exception) {
        console.error('Failed callback to load the content. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        await (winData as ohosWindow.Window).destroyWindow();
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetUIContent_Invalid_Parameter
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1420
     * @tc.desc   Verify the scene of loading the page with illegal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetUIContent_Invalid_Parameter', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let win: ohosWindow.Window | void;
      let msgStr = 'testSetUIContent_Invalid_Parameter'
      try {
        win =  await windowStage.createSubWindow('testSetUIContent_Invalid_Parameter').catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(win != null).assertTrue();
        try {
          await (win as ohosWindow.Window).setUIContent(null).then(async () => {
            console.info('Succeeded in loading the content.');
            expect().assertFail();
            await (win as ohosWindow.Window).destroyWindow();
            done();
          }).catch(async (err: BusinessError) => {
            console.error('Failed to load the content. Cause: ' + JSON.stringify(err));
            expect(err.code).assertEqual(401);
            await (win as ohosWindow.Window).destroyWindow();
            done()
          });
        } catch (exception) {
          console.error('Failed to load the content. exception: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          await (win as ohosWindow.Window).destroyWindow();
          done()
        }
        ;
      } catch (exception) {
        console.error('Failed to create the window2. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetUIContent_Not_Existent_Parameter
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1430
     * @tc.desc   Verify the scene of loading the page with illegal values
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetUIContent_Not_Existent_Parameter', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testSetUIContent_Not_Existent_Parameter'
      let win: ohosWindow.Window | void;
      try {
        win = await windowStage.createSubWindow('testSetUIContent_Not_Existent_Parameter').catch((err: BusinessError) => {
          console.log(msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        });
        console.log(msgStr + 'windowStage.createSubWindow success');
        expect(win != null).assertTrue();
        // 设置setUIContent
        await (win as ohosWindow.Window).setUIContent('pages/second/he').then(async () => {
          console.info('setUIContent3 . Cause: success');
          expect().assertFail();
          await (win as ohosWindow.Window).destroyWindow();
          done();
        }).catch(async (err: BusinessError) => {
          console.error('Failed to setUIContent3 . Cause:' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          await (win as ohosWindow.Window).destroyWindow();
          done();
        });
      } catch (exception) {
        console.error('Failed to create the window3. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowColorSpace_Multiple_Wide_Gamut
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1650
     * @tc.desc   To verify the setting of the wide color gamut color space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowColorSpace_Multiple_Wide_Gamut', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowColorSpace_Multiple_Wide_Gamut begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT).catch((err: BusinessError) => {
        console.info('windowTest SetWindowColorSpaceTest1 wnd.setColorSpace failed, err :' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      let windowColorSpace = wnd.getWindowColorSpace();
      expect(windowColorSpace == ohosWindow.ColorSpace.WIDE_GAMUT).assertTrue();
      console.info('windowTest SetWindowColorSpaceTest1 setColorSpace WIDE_GAMUT success');
      await wnd.isWindowSupportWideGamut().then(data => {
        expect(data).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest SetColorSpaceTest1 wnd.isWindowSupportWideGamut failed, err :' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowColorSpace_Invalid_ParamsTwo
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1670
     * @tc.desc   To verify that the color space of invaild values is set successfully
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowColorSpace_Invalid_ParamsTwo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowColorSpace_Invalid_ParamsTwo begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        let promise = wnd.setWindowColorSpace(-5);
        await promise.then(() => {
          console.info('Succeeded in setting window2 colorspace.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Failed to set window colorspacecatch2. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error('Failed to set window colorspaceexception2. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
      ;

    })

    /**
     * @tc.name   testSetWindowColorSpaceTest
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1100
     * @tc.desc   To verify the setting of the wide color gamut color space
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowColorSpaceTest', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowColorSpaceTest begin');
      let wnd = windowStage.getMainWindowSync();
      let msgStr = 'setColorSpace_Test_003'
      expect(wnd != null).assertTrue();
      let setColorSpaceFun: Function = () => {
        return new Promise<boolean>((resolve, reject) => {
          try {
            wnd.setColorSpace(ohosWindow.ColorSpace.WIDE_GAMUT, (err, data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(data));
              if (err && err.code) {
                try {
                  expect().assertFail();
                } catch (error) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
                }
                done();
                reject(null)
              }
              resolve(true)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }
      let isResultTrue: void;
      isResultTrue = await setColorSpaceFun();
      expect(isResultTrue).assertTrue();
      let windowColorSpace = wnd.getWindowColorSpace();
      expect(windowColorSpace == ohosWindow.ColorSpace.WIDE_GAMUT).assertTrue();
      wnd.isWindowSupportWideGamut((err, data) => {
        try {
          if (err.code != 0) {
            console.log('windowTest SetWindowColorSpaceTest3 getColorSpace callback fail' + JSON.stringify(err));
            expect().assertFail();
            done();
          } else {
            expect(data).assertTrue();
            done();
          }
        } catch (exception) {
          console.log('assertFail catch' + JSON.stringify(exception));
        }
      })
    })

    /**
     * @tc.name   testSetWindowBackgroundColor_Base_ParamsOne
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1460
     * @tc.desc   Set the window background color to red and Default opacity
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBackgroundColor_Base_ParamsOne', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest01 testSetWindowBackgroundColor_Base_ParamsOne begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#00ff33';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
        try {
          let properties = wnd.getWindowProperties();
          expect(!properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties001. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done();
        }
        ;
      } catch (exception) {
        console.error('Failed to set the background1 color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBackgroundColor_Base_ParamsTwo
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1480
     * @tc.desc   Set the window background color to red opaque
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBackgroundColor_Base_ParamsTwo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBackgroundColor_Base_ParamsTwo begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#ffffff00';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
        try {
          let properties = wnd.getWindowProperties();
          expect(!properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties002. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done();
        }
        ;
      } catch (exception) {
        console.error('Failed to set the background2 color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBackgroundColor_Base_ParamsThree
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1500
     * @tc.desc   Set the window background color to red transparent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBackgroundColor_Base_ParamsThree', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBackgroundColor_Base_ParamsThree begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#00ffff00';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
        try {
          let properties = wnd.getWindowProperties();
          expect(properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties003. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done();
        }
        ;
      } catch (exception) {
        console.error('Failed to set the background3 color. Cause: ' + JSON.stringify(exception));
        expect().assertFail();
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBackgroundColor_Invalid_ParamsTwo
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1510
     * @tc.desc   Set the background color input parameter as an outlier
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBackgroundColor_Invalid_ParamsTwo', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBackgroundColor_Invalid_ParamsTwo begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#ff00';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
      } catch (exception) {
        console.error('Failed to set the background4 color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBackgroundColor_Invalid_ParamsThree
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1520
     * @tc.desc   Setting window background color input exception ARGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBackgroundColor_Invalid_ParamsThree', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBackgroundColor_Invalid_ParamsThree begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#hhgghhgg';
      try {
        wnd.setWindowBackgroundColor(color);
        try {
          let properties = wnd.getWindowProperties();
          expect(!properties.isTransparent).assertTrue();
          done()
        } catch (exception) {
          console.error('Failed to obtain the window properties005. Cause: ' + JSON.stringify(exception));
          expect(exception.code).assertEqual(401);
          done()
        }
        ;
      } catch (exception) {
        console.error('Failed to set the background5 color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBackgroundColor_Base_ParamsFour
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1530
     * @tc.desc   Setting window background color input exception RGB
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBackgroundColor_Base_ParamsFour', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.log('windowTest testSetWindowBackgroundColor_Base_ParamsFour begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let color = '#hhgghhgg';
      try {
        wnd.setWindowBackgroundColor(color);
        done();
      } catch (exception) {
        console.error('Failed to set the background6 color. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBrightness_Multiple_Calls_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1580
     * @tc.desc   Setting the brightness bar input parameter is normal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBrightness_Multiple_Calls_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Multiple_Calls_Promise begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowBrightness(0).catch((err: BusinessError) => {
        console.info('windowTest setWindowBrightnessTest1 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      let data = wnd.getWindowProperties();
      expect(data.brightness).assertEqual(0);
      await wnd.setWindowBrightness(0.5).catch((err: BusinessError) => {
        console.log('windowTest setBrightnessTest1 setWindowBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      let data1 = wnd.getWindowProperties();
      expect(data1.brightness).assertEqual(0.5);
      await wnd.setWindowBrightness(1).then(() => {
        console.info('windowTest setWindowBrightnessTest1 setBrightness(1) success ');
        let data2 = wnd.getWindowProperties();
        expect(data2.brightness).assertEqual(1);
        done();
      }, (err: BusinessError) => {
        console.log('windowTest setWindwoBrightnessTest1 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowBrightness_Invalid_ParamsTwo_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1600
     * @tc.desc   Set the brightness bar input parameter to decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowBrightness_Invalid_ParamsTwo_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Invalid_ParamsTwo_Promise begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowBrightness(0.564789).then(() => {
        console.log('windowTest setBrightnessTest2 setBrightness(0.564789) success ');
        expect(TRUE_FLAG).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.log('windowTest setWindowBrightnessTest2 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })

    })

    /**
     * @tc.name   testSetWindowBrightness_Invalid_ParamsThree_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1620
     * @tc.desc   Set the brightness bar input parameter to number max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBrightness_Invalid_ParamsThree_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Invalid_ParamsThree_Promise begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let brightness: number = Number.MAX_VALUE;
      try {
        let promise = wnd.setWindowBrightness(brightness);
        await promise.then(() => {
          console.info('Succeeded3 in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Failed3 to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error('Failed3 to set the brightnessexception. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
      ;

    })

    /**
     * @tc.name   testSetWindowBrightness_Invalid_ParamsFour_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1630
     * @tc.desc   Set the brightness bar input parameter to number min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowBrightness_Invalid_ParamsFour_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Invalid_ParamsFour_Promise begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowBrightness(Number.MIN_VALUE).then(() => {
        console.info('windowTest setWindowBrightnessTest3 setBrightness(Number.MAX_VALUE) success ');
        expect(TRUE_FLAG).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest setWindowBrightnessTest4 setBrightness failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowBrightness_Invalid_ParamsFive_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1640
     * @tc.desc   Setting brightness bar input parameter exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBrightness_Invalid_ParamsFive_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Invalid_ParamsFive_Promise begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let brightness = 1.1;
      try {
        let promise = wnd.setWindowBrightness(brightness);
        await promise.then(() => {
          console.info('Succeeded5 in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Failed5 to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error('Failed5 to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
      ;

      try {
        let promise = wnd.setWindowBrightness(-0.5);
        await promise.then(() => {
          console.info('Succeeded55 in setting the brightness.');
          expect().assertFail();
          done();
        }).catch((err: BusinessError) => {
          console.error('Failed55 to set the brightness. Cause: ' + JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (exception) {
        console.error('Failed55 to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBrightness_Multiple_Calls_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1540
     * @tc.desc   et the brightness bar input parameter to decimal
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBrightness_Multiple_Calls_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Multiple_Calls_Callback begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowBrightness(1, (err: BusinessError) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback01. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            try {
              let properties: ohosWindow.WindowProperties = wnd.getWindowProperties();
              try {
                expect(properties.brightness).assertEqual(1);
              } catch (error) {
                console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
              }
              done();
            } catch (exception) {
              console.error('Failed04 to obtain the window properties. Cause: ' + JSON.stringify(exception));
              try {
                expect(exception.code).assertEqual(401);
              } catch (error) {
                console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
              }
              done();
            }
            ;
          }
        });
      } catch (exception) {
        console.error('Failedca02 to set the brightness. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done()
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBrightness_Invalid_ParamsOne_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1550
     * @tc.desc   Set the brightness bar input parameter to number max
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBrightness_Invalid_ParamsOne_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Invalid_ParamsOne_Callback begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let brightness: number = Number.MAX_VALUE;
      try {
        wnd.setWindowBrightness(brightness, (err: BusinessError) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback3. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('windowTest setBrightnessTest3CallBack setBrightness(Number.MAX_VALUE) success ');
            try {
              expect().assertFail();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the brightnesscall3CallBack. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBrightness_Invalid_ParamsTwo_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1560
     * @tc.desc   Set the brightness bar input parameter to number min
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBrightness_Invalid_ParamsTwo_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Invalid_ParamsTwo_Callback begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowBrightness(Number.MIN_VALUE, (err: BusinessError) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback4. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('windowTest setBrightnessTest4CallBack setBrightness(Number.MAX_VALUE) success ');
            try {
              expect(TRUE_FLAG).assertTrue();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the brightnesscall4CallBack. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowBrightness_Invalid_ParamsThree_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1570
     * @tc.desc   Setting brightness bar input parameter exception
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowBrightness_Invalid_ParamsThree_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowBrightness_Invalid_ParamsThree_Callback begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowBrightness(1.1, (err: BusinessError) => {
          if (err.code) {
            console.error('Failed to set the brightnesscallback5. Cause: ' + JSON.stringify(err));
            try {
              expect(err.code).assertEqual(401);
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('windowTest setBrightnessTest5CallBack setBrightness(Number.MAX_VALUE) success ');
            try {
              expect().assertFail();
            } catch (error) {
              console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the brightnesscall5CallBack. Cause: ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
      ;
    })

    /**
     * @tc.name   testSetWindowFocusable_Multiple_Calls_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1690
     * @tc.desc   Setting window focus acquisition and defocus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowFocusable_Multiple_Calls_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowFocusable_Multiple_Calls_Callback begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      let msgStr = 'testSetWindowFocusable_Multiple_Calls_Callback'
      expect(wnd != null).assertTrue();
      let setWindowFocusableFun: Function = () => {
        return new Promise<boolean>((resolve, reject) => {
          try {
            wnd.setWindowFocusable(false, (err, data) => {
              console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(data));
              if (err && err.code) {
                try {
                  expect().assertFail();
                } catch (error) {
                  console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(error)}`)
                }
                done();
                reject(null)
              }
              resolve(true)
            })
          } catch (exception) {
            console.error(msgStr + 'Failed to create the window. Cause: ' + JSON.stringify(exception));
          }
          ;
        })
      }
      let isResultTrue: void;
      isResultTrue = await setWindowFocusableFun()
      expect(isResultTrue).assertTrue();
      let data = wnd.getWindowProperties();
      expect(!data.focusable).assertTrue();
      wnd.setWindowFocusable(true, (err, data) => {
        if (err.code) {
          console.error('Failed to set the window to be setFocusable. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
          }
          done();
        } else {
          let data2 = wnd.getWindowProperties();
          try {
            expect(data2.focusable).assertTrue();
          } catch (error) {
            console.info(`wnd.setWindowBrightness catch error: ${JSON.stringify(error)}`)
          }
          done();
        }
      })
    })

    /**
     * @tc.name   testSetWindowFocusable_Multiple_Calls_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1700
     * @tc.desc   Setting window focus acquisition and defocus
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowFocusable_Multiple_Calls_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowFocusable_Multiple_Calls_Promise begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowFocusable(false).then(async () => {
        console.info('windowTest setFocusableTest1 setFocusable(false) success ');
        let data2 = wnd.getWindowProperties();
        expect(!data2.focusable).assertTrue();
      }, (err: BusinessError) => {
        console.log('windowTest setWinFocusableTest1 setFocusable failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      await wnd.setWindowFocusable(true).then(() => {
        console.info('windowTest setFocusableTest1 setFocusable(true) success ');
        expect(TRUE_FLAG).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest setFocusableTest1 setFocusable failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowTouchable_Invoked_Twice
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2050
     * @tc.desc   Set whether the window can be touched or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowTouchable_Invoked_Twice', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowTouchable_Invoked_Twice begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      let data = wnd.getWindowProperties();
      expect(data.touchable).assertTrue();
      await wnd.setWindowTouchable(false).then(async () => {
        console.info('windowTest setTouchableTest1 setTouchable(false) success ');
        let data2 = wnd.getWindowProperties();
        expect(!data2.touchable).assertTrue();
      }, (err: BusinessError) => {
        console.log('windowTest setTouchableTest1 setTouchable failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
      await wnd.setWindowTouchable(true).then(() => {
        console.info('windowTest setTouchableTest1 setTouchable(true) success ');
        let data3 = wnd.getWindowProperties();
        expect(data3.touchable).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest setTouchableTest1 setTouchable failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowTouchable_Callback_Form
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2030
     * @tc.desc   Set whether the window can be touched or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowTouchable_Callback_Form', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      let msgStr = 'testSetWindowTouchable_Callback_Form'
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();

      let setWindowTouchableFun: Function = () => {
        return new Promise<boolean>((resolve, reject) => {
          wnd.setWindowTouchable(false, (err, data) => {
            console.log(msgStr + 'ohosWindow.createWindow  data' + JSON.stringify(data));
            if (err && err.code) {
              try {
                expect().assertFail();
              } catch (err) {
                console.info(msgStr + `ohosWindow.createWindow catch error: ${JSON.stringify(err)}`)
              }
              done();
              reject(null)
            }
            resolve(true)
          })
        })
      }

      let isResultTrue: void;
      isResultTrue = await setWindowTouchableFun()
      expect(isResultTrue).assertTrue();
      let data: ohosWindow.WindowProperties = wnd.getWindowProperties();
      expect(!data.touchable).assertTrue();
      wnd.setWindowTouchable(true, (err, data) => {
        if (err.code) {
          console.error('Failed to set the window to be touchable. Cause:' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`wnd.setWindowTouchable catch error: ${JSON.stringify(error)}`)
          }
          done();
        } else {
          let data2 = wnd.getWindowProperties();
          try {
            expect(data2.touchable).assertTrue();
          } catch (error) {
            console.info(`wnd.setWindowTouchable catch error: ${JSON.stringify(error)}`)
          }
          done();
        }
      })
    })

    /**
     * @tc.name   testSetWindowKeepScreenOn_Base_True_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1750
     * @tc.desc   Set whether the window screenOn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowKeepScreenOn_Base_True_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowKeepScreenOn_Base_True_Promise begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowKeepScreenOn(true).then(() => {
        console.info('windowTest setKeepScreenOnTest2 setKeepScreenOn(false) success ');
        let data2 = wnd.getWindowProperties();
        expect(data2.isKeepScreenOn).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest setKeepScreenOnTest2 setKeepScreenOn failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowKeepScreenOn_Base_False_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1730
     * @tc.desc   Set whether the window screenOn
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowKeepScreenOn_Base_False_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowKeepScreenOn_Base_False_Promise begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowKeepScreenOn(false).then(() => {
        console.info('windowTest setKeepScreenOnTest1 setKeepScreenOn(false) success ');
        let data2 = wnd.getWindowProperties();
        expect(!data2.isKeepScreenOn).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest setKeepScreenOnTest1 setKeepScreenOn failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowKeepScreenOn_Base_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1720
     * @tc.desc   Set whether setKeepScreenOn or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowKeepScreenOn_Base_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowKeepScreenOn_Base_Callback begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      wnd.setWindowKeepScreenOn(true, (err, data) => {
        if (err.code) {
          console.error('Failed to set the screen to be always on. Cause: ' + JSON.stringify(err));
          try {
            expect().assertFail();
          } catch (error) {
            console.info(`wnd.setWindowKeepScreenOn catch error: ${JSON.stringify(error)}`)
          }
          done();
        } else {
          console.info('success set the screen to be always on. Cause: ' + JSON.stringify(data));
          let data2 = wnd.getWindowProperties();
          try {
            expect(data2.isKeepScreenOn).assertTrue();
          } catch (error) {
            console.info(`wnd.setWindowKeepScreenOn catch error: ${JSON.stringify(error)}`)
          }
          done();
        }
      })
    })

    /**
     * @tc.name   testSetWindowPrivacyMode_False_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1870
     * @tc.desc   Verify the window privacy mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowPrivacyMode_False_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowPrivacyMode_False_Promise begin');
      let wnd = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowPrivacyMode(false).then(() => {
        console.info('windowTest setWindowPrivacyMode1 success ');
        let data2 = wnd.getWindowProperties();
        expect(!data2.isPrivacyMode).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest setWindowPrivacyMode failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowPrivacyMode_True_Promise
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1890
     * @tc.desc   Verify the window privacy mode
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowPrivacyMode_True_Promise', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async (done: Function) => {
      console.info('windowTest testSetWindowPrivacyMode_True_Promise begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      await wnd.setWindowPrivacyMode(true).then(() => {
        console.info('windowTest setWindowPrivacyMode2 success ');
        let data2 = wnd.getWindowProperties();
        expect(data2.isPrivacyMode).assertTrue();
        done();
      }, (err: BusinessError) => {
        console.info('windowTest setWindowPrivacyMode2 failed: err' + JSON.stringify(err));
        expect().assertFail();
        done();
      })
    })

    /**
     * @tc.name   testSetWindowPrivacyMode_True_Callback
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_1860
     * @tc.desc   Set whether setWindowPrivacyMode or not
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL4
     */
    it('testSetWindowPrivacyMode_True_Callback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL4, async (done: Function) => {
      console.info('windowTest testSetWindowPrivacyMode_True_Callback begin');
      let wnd: ohosWindow.Window = windowStage.getMainWindowSync();
      expect(wnd != null).assertTrue();
      try {
        wnd.setWindowPrivacyMode(true, (err: BusinessError) => {
          if (err.code) {
            console.error('Failed to set the window to privacy mode. Cause:' + JSON.stringify(err));
            try {
              expect().assertFail();
            } catch (error) {
              console.info(`wnd.setWindowPrivacyMode catch error: ${JSON.stringify(error)}`)
            }
            done();
          } else {
            console.info('Succeeded in setting the window to privacy mode.');
            let data2 = wnd.getWindowProperties();
            try {
              expect(data2.isPrivacyMode).assertTrue();
            } catch (error) {
              console.info(`wnd.setWindowPrivacyMode catch error: ${JSON.stringify(error)}`)
            }
            done();
          }
        });
      } catch (exception) {
        console.error('Failed to set the window to privacy mode. Cause:' + JSON.stringify(exception));
        expect(exception.code).assertEqual(401);
        done();
      }
      ;

    })
  })
}
