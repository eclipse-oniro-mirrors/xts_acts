/*
 * Copyright (C) 2024 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, expect, it, TestType, Size, Level } from '@ohos/hypium';
import pointer from '@ohos.multimodalInput.pointer';
import { BusinessError }  from '@ohos.base';
import window from '@ohos.window';
import image from '@ohos.multimedia.image';

export default function MultimodalInputPointerTest() {
  describe("MultimodalInputPointerTest", ()=> {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisible_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisible_0100
     * @tc.desc: Test callback setPointerVisible interface to show or hide the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0100";
      try {
        let flag: number = 0;
        pointer.setPointerVisible(true, (err, data) => {
          if (err) {
            console.info(`${caseName} Set pointer visible failed, err=${JSON.stringify(err)}`);
            ExpectTrue(err.code == 801);
            done();
          } else {
            flag += 1;
            console.info(`${caseName} Set pointer visible success, data=${JSON.stringify(data)}`);
            ExpectTrue(flag == 1);
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisible_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisible_0200
     * @tc.desc: Test promise setPointerVisible interface to show or hide the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0200";
      try {
        let flag: number = 0;
        pointer.setPointerVisible(false).then(() => {
          flag += 1;
          console.info(`${caseName} Set pointer visible success`);
          ExpectTrue(flag == 1);
          done();
        }).catch((error: BusinessError) => {
          console.info(`${caseName} Set pointer visible failed, error=${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 801);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisible_0300
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisible_0300
     * @tc.desc: Test promise setPointerVisible interface to set null value.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0300";
      try {
        pointer.setPointerVisible(null).then(() => {
          console.info(`${caseName} Set pointer visible success`);
          ExpectFalse(true);
          done();
        })
      } catch (error) {
        console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100
     * @tc.desc: Test setPointerVisibleSync interface to show or hide the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100";
      let ifSetPointerVisibleSyncSuccess = 0;
      try {
        pointer.setPointerVisibleSync(false);
        console.info(`${caseName} Set pointer visible success`);
        ifSetPointerVisibleSyncSuccess++;
        ExpectTrue(ifSetPointerVisibleSyncSuccess == 1);
        done();
      } catch (error) {
        console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_isPointerVisible_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_isPointerVisible_0100
     * @tc.desc: Test callback isPointerVisible interface to get the display or hide status of the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0100";
      try {
        pointer.isPointerVisible((error: Error, visible: boolean) => {
          if (error) {
            console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
            ExpectTrue(typeof(visible) == 'boolean');
            done();
          }
        });
      } catch (error) {
        console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_isPointerVisible_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_isPointerVisible_0200
     * @tc.desc: Test promise isPointerVisible interface to get the display or hide status of the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0200";
      try {
        pointer.isPointerVisible().then((visible: boolean) => {
          console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
          ExpectTrue(typeof(visible) == 'boolean');
          done();
        });
      } catch (error) {
        console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100
     * @tc.desc: Test isPointerVisibleSync interface to get the display or hide status of the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100";
      try {
        let visible: boolean = pointer.isPointerVisibleSync();
        console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
        ExpectTrue(typeof(visible) == 'boolean');
        done();
      } catch (error) {
        console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyle_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyle_0100
     * @tc.desc: Test callback getPointerStyle interface to get the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0100";
      let context = getContext();
      window.getLastWindow(context, (error: BusinessError, win: window.Window) => {
        let windowId = win.getWindowProperties().id;
        if (error.code) {
          console.info(`${caseName} Failed to obtain the top window. Cause: ${JSON.stringify(error)}`);
          ExpectFalse(true);
          done();
        } else if (windowId < 0) {
          console.info(`${caseName} Invalid windowId`);
          ExpectFalse(true);
          done();
        } else {
          try {
            pointer.getPointerStyle(windowId, (error: Error, style: pointer.PointerStyle) => {
              console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
              ExpectTrue(style>=0 && style<=44);
              done();
            });
          } catch (error) {
            console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          }
        }
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyle_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyle_0200
     * @tc.desc: Test promise getPointerStyle interface to get the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0200";
      let context = getContext();
      window.getLastWindow(context, (error: BusinessError, win: window.Window) => {
        let windowId = win.getWindowProperties().id;
        if (error.code) {
          console.info(`${caseName} Failed to obtain the top window. Cause: ${JSON.stringify(error)}`);
          ExpectFalse(true);
          done();
        } else if (windowId < 0) {
          console.info(`${caseName} Invalid windowId`);
          ExpectFalse(true);
          done();
        } else {
          try {
            pointer.getPointerStyle(windowId).then((style: pointer.PointerStyle) => {
              console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
              ExpectTrue(style>=0 && style<=44);
              done();
            });
          } catch (error) {
            console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          }
        }
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyle_0300
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyle_0300
     * @tc.desc: Test promise getPointerStyle interface to set null value.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyle_0300";
      try {
        pointer.getPointerStyle(null).then(() => {
          console.info(`${caseName} get pointer style success`);
          ExpectFalse(true);
          done();
        })
      } catch (error) {
        console.info(`${caseName} get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100
     * @tc.desc: Test getPointerStyleSync interface to get the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100";
      try {
        let style: pointer.PointerStyle = pointer.getPointerStyleSync(-1);
        console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
        ExpectTrue(style>=0 && style<=44);
        done();
      } catch (error) {
        console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerStyle_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerStyle_0100
     * @tc.desc: Test callback setPointerStyle interface to set the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0100";
      let ifSetPointerStyleSuccess = 0;
      window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
        let windowId = win.getWindowProperties().id;
        if (error.code) {
          console.info(`${caseName} Failed to obtain the top window. Cause: ${JSON.stringify(error)}`);
          ExpectFalse(true);
          done();
        } else if (windowId < 0) {
          console.info(`${caseName} Invalid windowId`);
          ExpectFalse(true);
          done();
        } else {
          try {
            pointer.setPointerStyle(windowId, pointer.PointerStyle.CROSS, error => {
              console.info(`${caseName} Set pointer style success`);
              ifSetPointerStyleSuccess++;
              ExpectTrue(ifSetPointerStyleSuccess == 1);
              done();
            });
          } catch (error) {
            console.info(`${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          }
        }
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerStyle_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerStyle_0200
     * @tc.desc: Test promise setPointerStyle interface to set the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0200";
      let ifSetPointerStyleSuccess = 0;
      window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
        let windowId = win.getWindowProperties().id;
        if (error.code) {
          console.info(`${caseName} Failed to obtain the top window. Cause: ${JSON.stringify(error)}`);
          ExpectFalse(true);
          done();
        } else if (windowId < 0) {
          console.info(`${caseName} Invalid windowId`);
          ExpectFalse(true);
          done();
        } else {
          try {
            pointer.setPointerStyle(windowId, pointer.PointerStyle.CROSS).then(() => {
              console.info(`${caseName} Set pointer style success`);
              ifSetPointerStyleSuccess++;
              ExpectTrue(ifSetPointerStyleSuccess == 1);
              done();
            });
          } catch (error) {
            console.info(`${caseName} Set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          }
        }
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerStyle_0300
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerStyle_0300
     * @tc.desc: Test promise setPointerStyle interface to set null value.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0300";
      try {
        pointer.setPointerStyle(10, null).then(() => {
          console.info(`${caseName} set pointer style success`);
          ExpectFalse(true);
          done();
        })
      } catch (error) {
        console.info(`${caseName} set pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100
     * @tc.desc: Test setPointerStyleSync interface to set the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100";
      let ifSetPointerStyleSyncSuccess = 0;
      window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
        let windowId = win.getWindowProperties().id;
        if (error.code) {
          console.info(`${caseName} Failed to obtain the top window. Cause: ${JSON.stringify(error)}`);
          ExpectFalse(true);
          done();
        } else if (windowId < 0) {
          console.info(`${caseName} Invalid windowId`);
          ExpectFalse(true);
          done();
        } else {
          try {
            pointer.setPointerStyleSync(windowId, pointer.PointerStyle.CROSS);
            console.info(`${caseName} Set pointer style success`);
            ifSetPointerStyleSyncSuccess++;
            ExpectTrue(ifSetPointerStyleSyncSuccess == 1);
            done();
          } catch (error) {
            console.info(`${caseName} getPointerSize failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          }
        }
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0100
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0100";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try {
              pointer.setCustomCursor(windowId, pixelMap).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            } catch (error) {
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100
     * @tc.desc: Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100";
      let ifSetCustomCursorSyncSuccess = 0;
      const svgFileData = getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try {
              pointer.setCustomCursorSync(windowId, pixelMap, 25, 25);
              console.info(`${caseName} setCustomCursorSync success`);
              ifSetCustomCursorSyncSuccess++;
              ExpectTrue(ifSetCustomCursorSyncSuccess == 1);
              done();
            } catch (error) {
              console.info(`${caseName} setCustomCursorSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0200
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0200";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:1, height:1 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          console.info(`${caseName} pixelMap: ${JSON.stringify(pixelMap)}`);
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0300
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0300
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0300";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0400
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0400
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0400";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:1, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0500
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0500
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0500";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 256}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0600
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0600
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0600";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 256, focusY: 256}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0700
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0700
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0700";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 100, focusY: 100}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0800
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0800
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0800";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_0900
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_0900
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0900";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusY: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1000
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1000
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1000";
      let ifSetCustomCursorSuccess = 0;
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: false}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1100
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style with error windowId(-1).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1100";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            try{
              pointer.setCustomCursor(-1, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: false}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1200
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style with error windowId(10000).
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1200";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            try{
              pointer.setCustomCursor(10000, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: false}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              }).catch((error: BusinessError) => {
                console.info(`${caseName} setCustomCursor failed, error=${JSON.stringify(error)}`);
                ExpectTrue(error.code == 26500001);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1300
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1300
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1300";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: -1, focusY: 0}, {followSystem: false}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1400
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1400
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1400";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:256, height:256 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: -1}, {followSystem: false}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1500
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1500
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style with error windowId.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1500";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:1, height:257 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1600
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1600
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style with error windowId.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1600";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:257, height:1 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1700
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1700
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style with error windowId.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1700";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:257, height:257 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1800
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1800
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style with error windowId.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1800";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:64, height:64 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 65, focusY: 0}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_1900
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_1900
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style with error windowId.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_1900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_1900";
      getContext().resourceManager.getMediaContent($r("app.media.257x257")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width:64, height:64 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try{
              pointer.setCustomCursor(windowId, {pixelMap: pixelMap, focusX: 0, focusY: 65}, {followSystem: true}).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            }catch (error){
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error,[`code`,`message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200
     * @tc.desc: Test getPointerStyleSync interface to get the mouse style type.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0200";
      try {
        let windowId = -10000;
        let style: pointer.PointerStyle = pointer.getPointerStyleSync(windowId);
        console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} Get pointer style failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0200
     * @tc.desc: Test setPointerVisibleSync interface to show or hide the mouse pointer.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0200";
      let ifSetPointerVisibleSyncSuccess = 0;
      try {
        pointer.setPointerVisibleSync(false);
        console.info(`${caseName} Set pointer visible success`);
        ifSetPointerVisibleSyncSuccess++;
        ExpectTrue(ifSetPointerVisibleSyncSuccess == 1);
        done();
      } catch (error) {
        console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0300
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0300
     * @tc.desc: Test setPointerVisibleSync interface invalid input parameter
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0300";
      try {
        pointer.setPointerVisibleSync(undefined);
        ExpectFalse(true);
        done();
      } catch (error) {
        console.info(`${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectTrue(error.code == 401);
        done();
      }
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0200
     * @tc.desc: Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0200";
      const svgFileData = getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            let ifSetCustomCursorSyncSuccess = 0;
            try {
              let focusX = 25;
              pointer.setCustomCursorSync(windowId, pixelMap, focusX);
              console.info(`${caseName} setCustomCursorSync success`);
              ifSetCustomCursorSyncSuccess++;
              ExpectTrue(ifSetCustomCursorSyncSuccess == 1);
              done();
            } catch (error) {
              console.info(`${caseName} setCustomCursorSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0300
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0300
     * @tc.desc: Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0300";
      const svgFileData = getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            let ifSetCustomCursorSyncSuccess = 0;
            try {
              let focusY = 25;
              pointer.setCustomCursorSync(windowId, pixelMap, focusY);
              console.info(`${caseName} setCustomCursorSync success`);
              ifSetCustomCursorSyncSuccess++;
              ExpectTrue(ifSetCustomCursorSyncSuccess == 1);
              done();
            } catch (error) {
              console.info(`${caseName} setCustomCursorSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0400
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0400
     * @tc.desc: Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0400";
      const svgFileData = getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            let ifSetCustomCursorSyncSuccess = 0;
            try {
              pointer.setCustomCursorSync(windowId, pixelMap);
              console.info(`${caseName} setCustomCursorSync success`);
              ifSetCustomCursorSyncSuccess++;
              ExpectTrue(ifSetCustomCursorSyncSuccess == 1);
              done();
            } catch (error) {
              console.info(`${caseName} setCustomCursorSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0500
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0500
     * @tc.desc: Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0500";
      const svgFileData = getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = -10000;
            try {
              pointer.setCustomCursorSync(windowId, pixelMap, 0, 0);
              console.info(`${caseName} setCustomCursorSync success`);
              ExpectFalse(true);
              done();
            } catch (error) {
              console.info(`${caseName} setCustomCursorSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0600
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0600
     * @tc.desc: Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0600";
      const svgFileData = getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try {
              pointer.setCustomCursorSync(windowId, pixelMap, -25, 0);
              console.info(`${caseName} setCustomCursorSync success`);
              ExpectFalse(true);
              done();
            } catch (error) {
              console.info(`${caseName} setCustomCursorSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0700
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0700
     * @tc.desc: Test setCustomCursorSync interface to set the custom cursor style.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0700";
      const svgFileData = getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            try {
              pointer.setCustomCursorSync(windowId, pixelMap, 25, -1);
              console.info(`${caseName} setCustomCursorSync success`);
              ExpectFalse(true);
              done();
            } catch (error) {
              console.info(`${caseName} setCustomCursorSync failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_2000
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_2000
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 3
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_2000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_2000";
      getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = -10000;
            try {
              pointer.setCustomCursor(windowId, pixelMap).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ExpectFalse(true);
                done();
              });
            } catch (error) {
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectTrue(error.code == 401);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_2100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_2100
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_2100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_2100";
      getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            let ifSetCustomCursorSuccess = 0;
            try {
              let focusX = 25;
              pointer.setCustomCursor(windowId, pixelMap, focusX).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            } catch (error) {
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_2200
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_2200
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_2200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_2200";
      getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            let ifSetCustomCursorSuccess = 0;
            try {
              let focusY = 0;
              pointer.setCustomCursor(windowId, pixelMap, focusY).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            } catch (error) {
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

    /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_setCustomCursor_2300
     * @tc.name: SUB_MMI_Input_Api_Pointer_setCustomCursor_2300
     * @tc.desc: Test promise setCustomCursor interface to set the custom cursor style.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_2300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_2300";
      getContext().resourceManager.getMediaContent($r("app.media.app_icon")).then((svgFileData) => {
        const svgBuffer: ArrayBuffer = svgFileData.buffer.slice(0);
        let svgImagesource: image.ImageSource = image.createImageSource(svgBuffer);
        let svgDecodingOptions: image.DecodingOptions = {desiredSize: { width: 50, height:50 }};
        svgImagesource.createPixelMap(svgDecodingOptions).then((pixelMap) => {
          window.getLastWindow(getContext(), (error: BusinessError, win: window.Window) => {
            let windowId = win.getWindowProperties().id;
            let ifSetCustomCursorSuccess = 0;
            try {
              pointer.setCustomCursor(windowId, pixelMap, 25, 25).then(() => {
                console.info(`${caseName} setCustomCursor success`);
                ifSetCustomCursorSuccess++;
                ExpectTrue(ifSetCustomCursorSuccess == 1);
                done();
              });
            } catch (error) {
              console.info(`${caseName} setCustomCursor failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
              ExpectFalse(true);
              done();
            }
          });
        });
      });
    });

     /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_PrimaryButton_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_PrimaryButton_0100
     * @tc.desc: Test PrimaryButton LEFT and RIGHT Property
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_PrimaryButton_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_PrimaryButton_0100";
      try {
        let LEFT = pointer.PrimaryButton.LEFT;
        let RIGHT = pointer.PrimaryButton.RIGHT;
        console.info(`${caseName} LEFT: ${JSON.stringify(LEFT)}, RIGHT: ${JSON.stringify(RIGHT)}`);
        ExpectTrue(LEFT == 0);
        ExpectTrue(RIGHT == 1);
        done();
      } catch (error) {
        console.info(`${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

     /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_Style_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_Style_0100
     * @tc.desc: Test Pointer interface PointerStyle MIDDLE_BTN_EAST_WEST
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_Style_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_Style_0100";
      try {
        let MIDDLE_BTN_EAST_WEST = pointer.PointerStyle.MIDDLE_BTN_EAST_WEST;
        console.info(`${caseName} MIDDLE_BTN_EAST_WEST: ${JSON.stringify(MIDDLE_BTN_EAST_WEST)}`);
        ExpectTrue(MIDDLE_BTN_EAST_WEST == 44);
        done();
      } catch (error) {
        console.info(`${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

     /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_Style_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_Style_0200
     * @tc.desc: Test Pointer interface PointerStyle SCREENRECORDER_CURSOR
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_Style_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_Style_0200";
      try {
        let SCREENRECORDER_CURSOR = pointer.PointerStyle.SCREENRECORDER_CURSOR;
        console.info(`${caseName} SCREENRECORDER_CURSOR: ${JSON.stringify(SCREENRECORDER_CURSOR)}`);
        ExpectTrue(SCREENRECORDER_CURSOR == 48);
        done();
      } catch (error) {
        console.info(`${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });    

     /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_RightClickType_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_RightClickType_0100
     * @tc.desc: Test Pointer interface RightClickType TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON 
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_RightClickType_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_RightClickType_0100";
      try {
        let TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON = pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON;
        console.info(`${caseName} TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON: ${JSON.stringify(TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON)}`);
        ExpectTrue(TOUCHPAD_TWO_FINGER_TAP_OR_RIGHT_BUTTON == 4);
        done();
      } catch (error) {
        console.info(`${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });

     /**
     * @tc.number: SUB_MMI_Input_Api_Pointer_RightClickType_0200
     * @tc.name: SUB_MMI_Input_Api_Pointer_RightClickType_0200
     * @tc.desc: Test Pointer interface RightClickType TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON 
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_RightClickType_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_RightClickType_0200";
      try {
        let TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON = pointer.RightClickType.TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON;
        console.info(`${caseName} TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON: ${JSON.stringify(TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON)}`);
        ExpectTrue(TOUCHPAD_TWO_FINGER_TAP_OR_LEFT_BUTTON == 5);
        done();
      } catch (error) {
        console.info(`${caseName} failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
        done();
      }
    });
  });
}