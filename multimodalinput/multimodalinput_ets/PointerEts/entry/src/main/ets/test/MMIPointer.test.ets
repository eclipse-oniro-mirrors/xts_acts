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

import { describe, expect, it } from '@ohos/hypium';
import pointer from '@ohos.multimodalInput.pointer';
import { BusinessError }  from '@ohos.base';
import window from '@ohos.window';
import image from '@ohos.multimedia.image';

export default function MMIPointerTest() {
  describe("MMIPointerTest", ()=> {
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
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0100";
      try {
        pointer.setPointerVisible(true, (error: Error) => {
          if (error) {
            console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Set pointer visible success`);
            ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_setPointerVisible_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisible_0200";
      try {
        pointer.setPointerVisible(false).then(() => {
          console.info(`${caseName} Set pointer visible success`);
          ExpectTrue(true);
          done();
        });
      } catch (error) {
        console.info(`${caseName} Set pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
        ExpectFalse(true);
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
    it("SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerVisibleSync_0100";
      try {
        pointer.setPointerVisibleSync(false);
        console.info(`${caseName} Set pointer visible success`);
        ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0100";
      try {
        pointer.isPointerVisible((error: Error, visible: boolean) => {
          if (error) {
            console.info(`${caseName} Get pointer visible failed, error: ${JSON.stringify(error, [`code`, `message`])}`);
            ExpectFalse(true);
            done();
          } else {
            console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
            ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_isPointerVisible_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisible_0200";
      try {
        pointer.isPointerVisible().then((visible: boolean) => {
          console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
          ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_isPointerVisibleSync_0100";
      try {
        let visible: boolean = pointer.isPointerVisibleSync();
        console.info(`${caseName} Get pointer visible success, visible: ${JSON.stringify(visible)}`);
        ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0100", 0, async (done:Function)=> {
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
              ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_getPointerStyle_0200", 0, async (done:Function)=> {
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
              ExpectTrue(true);
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
     * @tc.number: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100
     * @tc.desc: Test getPointerStyleSync interface to get the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_getPointerStyleSync_0100";
      try {
        let style: pointer.PointerStyle = pointer.getPointerStyleSync(-1);
        console.info(`${caseName} Get pointer style success, style: ${JSON.stringify(style)}`);
        ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0100";
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
              ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_setPointerStyle_0200", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyle_0200";
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
              ExpectTrue(true);
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
     * @tc.number: SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100
     * @tc.name: SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100
     * @tc.desc: Test setPointerStyleSync interface to set the mouse style type.
     * @tc.level 2
     * @tc.type: Function
     * @tc.size: SmallTest
     */
    it("SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setPointerStyleSync_0100";
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
            ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_setCustomCursor_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursor_0100";
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
                ExpectTrue(true);
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
    it("SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100", 0, async (done:Function)=> {
      let caseName = "SUB_MMI_Input_Api_Pointer_setCustomCursorSync_0100";
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
              ExpectTrue(true);
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
  });
}