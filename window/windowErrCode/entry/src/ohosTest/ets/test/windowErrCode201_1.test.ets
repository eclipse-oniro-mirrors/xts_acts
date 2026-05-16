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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import ohosWindow from '@ohos.window';
import { BusinessError } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { Driver, ON } from '@kit.TestKit';
import floatingBall from '@ohos.window.floatingBall';
import deviceInfo from '@ohos.deviceInfo';
import { image } from '@kit.ImageKit';

export default function windowErrCode201_1() {
  describe('windowErrCode201_1', () => {
    console.log('describe windowErrCode201_1 start!!!')
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let context : common.UIAbilityContext;
    let windowStage:ohosWindow.WindowStage;
    let deviceType: string = deviceInfo.deviceType;
    let mainWindowClass: ohosWindow.Window;

    beforeAll(() => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context))
      windowStage = AppStorage.get('windowStage') as ohosWindow.WindowStage;
      mainWindowClass = windowStage.getMainWindowSync();
    })

    /**
     * @tc.name   testsetWindowTopmostErrCode201_0100
     * @tc.number testsetWindowTopmostErrCode201_0100
     * @tc.desc   testsetWindowTopmostErrCode201_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testsetWindowTopmostErrCode201_0100', Level.LEVEL0, async (done: Function) => {
      let caseName = "testsetWindowTopmostErrCode201_0100";
      let msgStr = 'jsunittest ' + caseName + ' ';
      console.log(msgStr + 'begin.');
      try {
        let windowClass = windowStage.getMainWindowSync();
        let isWindowTopmost: boolean = true;
        let promiseTopmost = windowClass.setWindowTopmost(isWindowTopmost);
        promiseTopmost.then(() => {
          console.info(msgStr +'Succeeded in setting the main window to be topmost.');
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(msgStr +`Failed to set the main window to be topmost. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(201);
          expect(err.message!=null).assertTrue();
          done()
        });
      } catch (exception) {
        console.error(msgStr + 'Failed to set the call setWindowTopmost. Cause:' + JSON.stringify(exception.code) + `message:${exception.message}`);
        if(exception.code == 801){
          expect(exception.message!=null).assertTrue();
          done();
        }else{
          expect(false).assertTrue();
          done()
        }

      }
    })

    /**
     * @tc.name   test_startFloatingBall_ErrorCode_201
     * @tc.number test_startFloatingBall_ErrorCode_201
     * @tc.desc   test_startFloatingBall_ErrorCode_201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_startFloatingBall_ErrorCode_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let CaseName:string = 'test_startFloatingBall_ErrorCode_201';
      let config: floatingBall.FloatingBallConfiguration = {
        context: context,
      };
      let startParams: floatingBall.FloatingBallParams = {
        template: floatingBall.FloatingBallTemplate.EMPHATIC,
        title: 'title',
        content: 'content'
      };
      try {
        floatingBall.create(config).then((data: floatingBall.FloatingBallController) => {
          let floatingBallController: floatingBall.FloatingBallController = data;
          console.info(CaseName+ ` Succeeded in creating floating ball controller. Data: ${data}`);

          floatingBallController.startFloatingBall(startParams).then(() => {
            console.info(CaseName+' Succeeded in starting floating ball.');
            expect(false).assertTrue();
            done();
          }).catch((err: BusinessError) => {
            console.error(CaseName+ ` Failed to start floating ball. Cause:${err.code}, message:${err.message}`);
            expect(err.code).assertEqual(201);
            expect(err.message!=null).assertTrue();
            done();
          });
        }).catch((err: BusinessError) => {
          console.error(CaseName+ ` Failed to create floating ball controller. Cause:${err.code}, message:${err.message}`);
          if(err.code == 801){
            expect(err.message!=null).assertTrue();
            done()
          }else {
            expect(false).assertTrue();
            done();
          }

        });
      } catch(e) {
        console.error( CaseName+  `Failed to test_Create_1300019. Cause:${e.code}, message:${e.message}`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   testSetTouchableAreas_singleRect
     * @tc.number SUB_WINDOW_SETTOUCHABLEAREAS_FUNCTION_0100
     * @tc.desc   设置单个可触摸区域，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetTouchableAreas_singleRect', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testSetTouchableAreas_singleRect';
      let touchableRects: Array<ohosWindow.Rect> = [
        { left: 100, top: 100, width: 200, height: 200 }
      ];
      try {
        await mainWindowClass.setTouchableAreas(touchableRects);
        console.info(`${message} Succeeded in setting touchable areas.`);
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
        if (exception.code === 201) {
          console.info(`${message} Capability not supported.`);
          done();
        } else {
          expect().assertFail();
          done();
        }
      }
    });

    /**
     * @tc.name   testSetWindowContainerModalColor_standardRGB
     * @tc.number SUB_WINDOW_SETWINDOWCONTAINERMODALCOLOR_FUNCTION_0100
     * @tc.desc   设置标准RGB颜色，验证接口调用成功
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testSetWindowContainerModalColor_standardRGB', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let message = 'testSetWindowContainerModalColor_standardRGB';
      let activeColor: string = '#FF0000';
      let inactiveColor: string = '#00FF00';
      if (deviceType === '2in1') {
        try {
          mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
          console.info(`${message} Succeeded in setting window container modal color.`);
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 201) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }else{
        try {
          mainWindowClass.setWindowContainerModalColor(activeColor, inactiveColor);
          console.info(`${message} Succeeded in setting window container modal color.`);
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          console.error(`${message} Exception. Cause: ${exception.code}, ${exception.message}`);
          if (exception.code === 801) {
            console.info(`${message} Capability not supported.`);
            done();
          } else {
            expect().assertFail();
            done();
          }
        }
      }
    });

    /**
     * @tc.name   setImageForRecent_201
     * @tc.number SUB_BASIC_WMS_setImageForRecent_0100
     * @tc.desc   setImageForRecent_201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('setImageForRecent_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'setImageForRecent_201';
      console.log( caseName +' begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      let color = new ArrayBuffer(512 * 512 * 4); // 创建一个ArrayBuffer对象，用于存储图像像素。该对象的大小为（height * width * 4）字节。
      let pixelMap: image.PixelMap;
      let bufferArr = new Uint8Array(color);
      for (let i = 0; i < bufferArr.length; i += 4) {
        bufferArr[i] = 255;
        bufferArr[i+1] = 0;
        bufferArr[i+2] = 122;
        bufferArr[i+3] = 255;
      }
      image.createPixelMap(color, {
        editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
      }).then((data) => {
        pixelMap = data;
        console.info(caseName +` Succeeded in creating pixelMap`);
        try {
          let promise = windowStage.setImageForRecent(pixelMap, ImageFit.Fill);
          promise.then(() => {
            console.info(caseName +` Succeeded in setting image for recent`);
            expect(false).assertTrue();
            done()
          }).catch((err: BusinessError) => {
            console.error(caseName +` Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
            if (!canIUseRes) {
              expect(err.code).assertEqual(801);
              done();
            } else {
              expect(err.code).assertEqual(201);
              done();
            }
          });
        } catch (exception) {
          console.error(caseName +` Failed to set image for recent.`);
          expect(false).assertTrue();
          done()
        }
      })
    })


    /**
     * @tc.name   removeImageForRecent_201
     * @tc.number SUB_BASIC_WMS_removeImageForRecent_0100
     * @tc.desc   removeImageForRecent_201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('removeImageForRecent_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done:Function) => {
      let caseName = 'removeImageForRecent_201';
      console.log( caseName +' begin');
      let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
      console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
      try {
        let promise = windowStage.removeImageForRecent();
        promise.then(() => {
          console.info(caseName +`Succeeded in removing image for recent`);
          expect(false).assertTrue();
          done()
        }).catch((err: BusinessError) => {
          console.error(caseName +`Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
          if (!canIUseRes) {
            expect(err.code).assertEqual(801);
            done();
          } else {
            expect(err.code).assertEqual(201);
            done();
          }
        });
      } catch (exception) {
        console.error(caseName +` Failed to remove image for recent.`);
        expect(false).assertTrue();
        done()
      }
    })


  })
}