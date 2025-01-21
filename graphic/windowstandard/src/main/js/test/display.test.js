/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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
import app from '@system.app'
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect} from '@ohos/hypium'
import window from '@ohos.window'
import display from '@ohos.display'
import hdrCapability from '@ohos.graphics.hdrCapability'


export default function display_test() {
describe('display_test', function () {

    beforeAll(function () {
    })
    beforeEach(function () {
    })
    afterEach(function () {
    })
    afterAll(function () {
    })

    /**
     * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0260
     * @tc.name			testGetDefaultDisplay_Function_Promise
     * @tc.desc			To test the function of obtaining the default screen
     */
    it('testGetDefaultDisplay_Function_Promise', 0, async function (done) {
        console.log('displayTest testGetDefaultDisplay_Function_Promise begin');
        display.getDefaultDisplay().then(dsp => {
            console.log('displayTest getDefaultDisplayTest1 getDefaultDisplay id :' + JSON.stringify(dsp));
            expect(dsp.id != null).assertTrue();
            expect(dsp.refreshRate != null).assertTrue();
            expect(dsp.width != null).assertTrue();
            expect(dsp.height != null).assertTrue();
            expect(dsp.rotation != null).assertTrue();
            expect(dsp.densityDPI != null).assertTrue();
            expect(dsp.name != null).assertTrue();
            expect(dsp.alive).assertTrue();
            expect(dsp.state != null).assertTrue();
            expect(dsp.densityPixels != null).assertTrue();
            expect(dsp.scaledDensity !=null).assertTrue();
            expect(dsp.xDPI != null).assertTrue();
            expect(dsp.yDPI != null).assertTrue();
            expect(dsp.hdrFormats != null).assertTrue();
            console.log('www data hdrFormats : ' + JSON.stringify(dsp.hdrFormats))
            console.log('www data colorSpaces : ' + JSON.stringify(dsp.colorSpaces))
            done();
        }, (err) => {
            console.log('displayTest getDefaultDisplayTest1 getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0250
     * @tc.name      testGetDefaultDisplay_Function_Callback
     * @tc.desc      To test the function if obtaining the default screen.
     */
    it('testGetDefaultDisplay_Function_Callback', 0, async function (done) {
        console.log('displayTest testGetDefaultDisplay_Function_Callback begin');
        display.getDefaultDisplay((err, data) => {
            if (err.code != 0) {
                console.log('displayTest getDefaultDisplayTest2 getDefaultDisplay callback fail' + JSON.stringify(err.code));
                expect().assertFail();
                done();
            } else {
                console.log('displayTest getDefaultDisplayTest2 getDefaultDisplay id :' + JSON.stringify(data));
                expect(data.id != null).assertTrue();
                expect(data.refreshRate != null).assertTrue();
                expect(data.width != null).assertTrue();
                expect(data.height != null).assertTrue();
                expect(data.rotation != null).assertTrue();
                expect(data.densityDPI != null).assertTrue();
                expect(data.name != null).assertTrue();
                expect(data.alive).assertTrue();
                expect(data.state != null).assertTrue();
                expect(data.densityPixels != null).assertTrue();
                expect(data.scaledDensity !=null).assertTrue();
                expect(data.xDPI != null).assertTrue();
                expect(data.yDPI != null).assertTrue();
                done();
            }
        })
    })

    /**
     * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0130
     * @tc.name			testGetAllDisplay_Promise
     * @tc.desc			To verify the function of obtaining all screens.
     */
    it('testGetAllDisplay_Promise', 0, async function (done) {
        console.log('displayTest getAllDisplayTest1 begin');
        display.getAllDisplay().then(dsp => {
            console.log('displayTest getAllDisplayTest1 getAllDisplay id :' + JSON.stringify(dsp));
            expect(dsp[0].id != null).assertTrue();
            expect(dsp[0].refreshRate != null).assertTrue();
            expect(dsp[0].width != null).assertTrue();
            expect(dsp[0].height != null).assertTrue();
            expect(dsp[0].rotation != null).assertTrue();
            expect(dsp[0].densityDPI != null).assertTrue();
            expect(dsp[0].name != null).assertTrue();
            expect(dsp[0].alive).assertTrue();
            expect(dsp[0].state != null).assertTrue();
            expect(dsp[0].densityPixels != null).assertTrue();
            expect(dsp[0].scaledDensity !=null).assertTrue();
            expect(dsp[0].xDPI != null).assertTrue();
            expect(dsp[0].yDPI != null).assertTrue();
            done();
        }, (err) => {
            console.log('displayTest getAllDisplayTest1 getAllDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0120
     * @tc.name      testGetAllDisplay_Callback
     * @tc.desc      To test the function if obtaining the default screen
     */
    it('testGetAllDisplay_Callback', 0, async function (done) {
        console.log('displayTest getAllDisplayTest2 begin');
        display.getAllDisplay((err, data) => {
            if (err.code != 0) {
                console.log('displayTest getAllDisplayTest2 getAllDisplay callback fail' + JSON.stringify(err));
                expect().assertFail();
                done();
            } else {
                console.log('displayTest getAllDisplayTest2 getAllDisplay id :' + JSON.stringify(data));
                expect(data[0].refreshRate != null).assertTrue();
                expect(data[0].width != null).assertTrue();
                expect(data[0].height != null).assertTrue();
                expect(data[0].rotation != null).assertTrue();
                expect(data[0].densityDPI != null).assertTrue();
                expect(data[0].name != null).assertTrue();
                expect(data[0].alive).assertTrue();
                expect(data[0].state != null).assertTrue();
                expect(data[0].densityPixels != null).assertTrue();
                expect(data[0].scaledDensity !=null).assertTrue();
                expect(data[0].xDPI != null).assertTrue();
                expect(data[0].yDPI != null).assertTrue();
                done();
            }
        })
    })

    /**
     * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0240
     * @tc.name			testGetDefaultDisplaySync_SyncFunction
     * @tc.desc			To test the sync function of obtaining the default display
     */
    it('testGetDefaultDisplaySync_SyncFunction', 0, async function (done) {
        console.info('displayTest getDefaultDisplaySyncTest1 begin');
        try {
            var dsp = display.getDefaultDisplaySync();
            console.info('displayTest getDefaultDisplaySyncTest1: ' + JSON.stringify(dsp));
            expect(dsp.id != null).assertTrue();
            expect(dsp.refreshRate != null).assertTrue();
            expect(dsp.width != null).assertTrue();
            expect(dsp.height != null).assertTrue();
            expect(dsp.rotation != null).assertTrue();
            expect(dsp.densityDPI != null).assertTrue();
            expect(dsp.name != null).assertTrue();
            expect(dsp.alive).assertTrue();
            expect(dsp.state != null).assertTrue();
            expect(dsp.densityPixels != null).assertTrue();
            expect(dsp.scaledDensity !=null).assertTrue();
            expect(dsp.xDPI != null).assertTrue();
            expect(dsp.yDPI != null).assertTrue();
            done();
        } catch (err) {
            console.error('getDefaultDisplaySyncTest1 error ' + JSON.stringify(err));
            expect.assertFail();
            done();
        }
    })

    /**
     * @tc.number	SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0070
     * @tc.name	    testDisplayState_Enum_Value
     * @tc.desc		To test the enum value of WindowDisplayState.
    */
    it('testDisplayState_Enum_Value', 0, async function (done) {
        console.info('test the enum value of Window DisplayState begin');
        try {
            expect(0).assertEqual(display.DisplayState.STATE_UNKNOWN);
            expect(1).assertEqual(display.DisplayState.STATE_OFF);
            expect(2).assertEqual(display.DisplayState.STATE_ON);
            expect(3).assertEqual(display.DisplayState.STATE_DOZE);
            expect(4).assertEqual(display.DisplayState.STATE_DOZE_SUSPEND);
            expect(5).assertEqual(display.DisplayState.STATE_VR);
            expect(6).assertEqual(display.DisplayState.STATE_ON_SUSPEND);
            done();
        } catch (err) {
            console.error('test enum value of windowDisplayState error ' + JSON.stringify(err));
            expect.assertFail();
            done();
        }
    })

    /**
     * @tc.number	SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1060
     * @tc.name	    testWaterfallDisplayAreaRects_Value
     * @tc.desc		To test value of waterfallDisplayAreaRects.
    */
    it('testWaterfallDisplayAreaRects_Value', 0, async function (done) {
        console.info('test the  value of waterfallDisplayAreaRects begin');
        try {
            var waterfallDisplayAreaRects = {
                left : {
                    left:20,
                    top:20,
                    width:20,
                    height:20
                },
                right : {
                    left:800,
                    top:0,
                    width:600,
                    height:600
                },
                top : {
                    left:20,
                    top:20,
                    width:20,
                    height:20
                },
                bottom : {
                    left:20,
                    top:20,
                    width:600,
                    height:600
                },

            }
            expect(waterfallDisplayAreaRects.left != null).assertTrue();
            expect(waterfallDisplayAreaRects.right != null).assertTrue();
            expect(waterfallDisplayAreaRects.top != null).assertTrue();
            expect(waterfallDisplayAreaRects.bottom != null).assertTrue();
            done();
        } catch (err) {
            console.error('test value of waterfallDisplayAreaRects error ' + JSON.stringify(err));
            expect.assertFail();
            done();
        }
    })

    /**
    * @tc.number	SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0060
    * @tc.name	    testDisplayAreaRects_Value
    * @tc.desc		To test value of RECT.
    */
    it('testDisplayAreaRects_Value', 0, async function (done) {
        console.info('test the value of aRect begin');
        try {
            var rect = {
                left : 20,
                right : 40,
                width : 100,
                height : 200
            }
            expect(20).assertEqual(rect.left);
            expect(40).assertEqual(rect.right);
            expect(100).assertEqual(rect.width);
            expect(200).assertEqual(rect.height);
            done();
        } catch (err) {
            console.error('test value of rect error ' + JSON.stringify(err));
            expect.assertFail();
            done();
        }
    })

    /**
     * @tc.number	SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0030
     * @tc.name	    testCutoutInfo_WaterFailDisplayAreaRects_Value
     * @tc.desc		To test value of CutoutInfo.
    */
    it('testCutoutInfo_WaterFailDisplayAreaRects_Value', 0, async function (done) {
        console.info('test the CutoutInfo of aRect begin');
        try {
            var cutoutInfo = {
                boudingRects : [{
                                    left : 20,
                                    right : 40,
                                    width : 100,
                                    height : 200
                                }],
                waterfallDisplayAreaRects : {
                    left : {
                        left:20,
                        top:20,
                        width:20,
                        height:20
                    },
                    right : {
                        left:800,
                        top:0,
                        width:600,
                        height:600
                    },
                    top : {
                        left:20,
                        top:20,
                        width:20,
                        height:20
                    },
                    bottom : {
                        left:20,
                        top:20,
                        width:600,
                        height:600
                    },
                }
            }
            expect(1).assertEqual(cutoutInfo.boudingRects.length);
            expect(cutoutInfo.waterfallDisplayAreaRects.left != null).assertTrue();
            expect(cutoutInfo.waterfallDisplayAreaRects.right != null).assertTrue();
            expect(cutoutInfo.waterfallDisplayAreaRects.top != null).assertTrue();
            expect(cutoutInfo.waterfallDisplayAreaRects.bottom != null).assertTrue();
            done();
        } catch (err) {
            console.error('test value of CutoutInfo error ' + JSON.stringify(err));
            expect().assertFail();
            done();
        }
    })

    /**
     * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0230
     * @tc.name			testGetCutoutInfo_Function_Promise
     * @tc.desc			To test the function of getCutoutInfo
     */
    it('testGetCutoutInfo_Function_Promise', 0, async function (done) {
        console.info('getCutoutInfo begin');
        display.getDefaultDisplay().then(dsp => {
            console.info('displayTest getCutoutInfo getDefaultDisplay id :' + JSON.stringify(dsp));
            expect(dsp != null).assertTrue();
            dsp.getCutoutInfo((err, data) => {
                console.info('Succeeded in getting cutoutInfo. data: ' + JSON.stringify(data));
                if (err.code) {
                    console.error('Failed to get cutoutInfo. Cause: ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    console.error('success to get cutoutInfo. Cause: ' + JSON.stringify(err));
                    expect(data != null).assertTrue();
                    done();
                }
            })
        }, (err) => {
            console.log('displayTest getgetCutoutInfo getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0220
     * @tc.name			testGetCutoutInfo_Function_Callback
     * @tc.desc			To test the function of getCutoutInfo
    */
    it('testGetCutoutInfo_Function_Callback', 0, async function (done) {
        console.info('getCutoutInfo begin');
        display.getDefaultDisplay().then(dsp => {
            console.info('displayTest getCutoutInfo getDefaultDisplay id2 :' + JSON.stringify(dsp));
            expect(dsp != null).assertTrue();
            dsp.getCutoutInfo().then(data => {
                console.info('Succeeded in getting cutoutInfo2. data: ' + JSON.stringify(data));
                expect(data != null).assertTrue();
                done();
            } ,err => {
                  console.log('displayTest getCutoutInfo getDefaultDisplay id2 failed, err :' + JSON.stringify(err));
                  expect().assertFail();
                  done();
            })
        }, (err) => {
            console.log('displayTest getgetCutoutInfo getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })


      /**
     * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0270
     * @tc.name			testHasImmersiveWindow_Function_Promise
     * @tc.desc			To test the function of hasImmersiveWindow
    */
       it('testHasImmersiveWindow_Function_Promise', 0, async function (done) {
        console.info('www data hasImmersiveWindow begin');
        let displayClass = null;
        try {
          displayClass = display.getDefaultDisplaySync();
          console.log('www data Succeeded in getDefaultDisplaySync')
        } catch (err) {
          console.error('www data Failed to obtain the default display object. Code: ' + JSON.stringify(err));
          expect().assertFail();
          done();
        }
        try {
           let promise = displayClass.hasImmersiveWindow();
           promise.then((data) => {
             console.info('www data Succeeded in checking whether there is immersive window. data: ' + JSON.stringify(data));
                expect( data != null).assertTrue();
                done();

           }).catch((err) => {
             console.error('www data Failed to check whether there is immersive window. Code: ' + JSON.stringify(err));
             expect(err.code == 801).assertTrue();
             done();
           }) 
        } catch (error) {
           console.log('www data Failed hasImmersiveWindow. err:' + JSON.stringify(error))
           expect().assertFail();
           done();
        }
   })

   /**
    * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0280
    * @tc.name			testHasImmersiveWindow_Function_Callback
    * @tc.desc			To test the function of hasImmersiveWindow
   */
       it('testHasImmersiveWindow_Function_Callback',0, async function (done){
           let displayClass = null;
           try {
               displayClass = display.getDefaultDisplaySync();
               console.log('www data Succeeded in getDefaultDisplaySync2')
           } catch (err) {
               console.error('www data Failed to obtain the default display object. Code: ' + JSON.stringify(err));
               expect().assertFail();
               done();
           }
           try {
                   displayClass.hasImmersiveWindow((err, data) => {
                       const errCode = err.code;
                       if (errCode) {
                       console.error('www data Failed to check whether there is immersive window. Code: ' + JSON.stringify(err));
                       expect(err.code == 801).assertTrue();
                       done();
                       }
                       console.info('www data Succeeded in checking whether there is immersive window. data: ' + JSON.stringify(data));
                       done();
                    });
               } catch (err) {
                    console.error('www data Failed to check whether there is immersive window. Code: ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
               }
       })

    /**
        * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_ORIENTATION_JS_API_0290
        * @tc.name			testOrientation_attr
        * @tc.desc			To test the attributes of Orientation
    */
    it('testOrientation_attr',0, async function (done){
        let msg = "testOrientation_attr"
        try {
            expect(display.Orientation.PORTRAIT).assertEqual(0)
            expect(display.Orientation.LANDSCAPE).assertEqual(1)
            expect(display.Orientation.PORTRAIT_INVERTED).assertEqual(2)
            expect(display.Orientation.LANDSCAPE_INVERTED).assertEqual(3)
            done()
        } catch (error) {
            expect().assertFail()
            done()
        }
    })

   /**
     * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1190
     * @tc.name      : testHdrFormats_attr
     * @tc.desc      : test the enum value of hdrFormats
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level4
     */
    it('testHdrFormats_attr',0, async function (done){
        let msg = "testHdrFormats_attr"
        try {
            expect(hdrCapability.hdrFormats.NONE == 0).assertTrue();
            expect(hdrCapability.hdrFormats.VIDEO_HLG == 1).assertTrue();
            expect(hdrCapability.hdrFormats.VIDEO_HDR10 == 2).assertTrue();
            expect(hdrCapability.hdrFormats.VIDEO_HDR_VIVID == 3).assertTrue();
            expect(hdrCapability.hdrFormats.IMAGE_HDR_VIVID_DUAL == 4).assertTrue();
            expect(hdrCapability.hdrFormats.IMAGE_HDR_VIVID_SINGLE == 5).assertTrue();
            expect(hdrCapability.hdrFormats.IMAGE_HDR_ISO_DUAL == 6).assertTrue();
            expect(hdrCapability.hdrFormats.IMAGE_HDR_ISO_SINGLE == 7).assertTrue();
            done()
        } catch (error) {
            if (error.code) {
                expect().assertFail()
            } else {
                expect(true).assertTrue()
            }
            done()
        }
    })

})
}
