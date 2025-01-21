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
     * @tc.number		SUB_WMS_GETDEFALUTDISPLAY_JSAPI_001
     * @tc.name			Test getDefaultDisplay_Test_001
     * @tc.desc			To test the function of obtaining the default screen
     */
    it('getDefaultDisplay_Test_001', 0, async function (done) {
        console.log('displayTest getDefaultDisplayTest1 begin');
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
            done();
        }, (err) => {
            console.log('displayTest getDefaultDisplayTest1 getDefaultDisplay failed, err :' + JSON.stringify(err));
            expect().assertFail();
            done();
        })
    })

    /**
     * @tc.number    SUB_WMS_GETDEFALUTDISPLAY_JSAPI_001
     * @tc.name      Test getDefaultDisplay_Test_002.
     * @tc.desc      To test the function if obtaining the default screen.
     */
    it('getDefaultDisplay_Test_002', 0, async function (done) {
        console.log('displayTest getDefaultDisplayTest2 begin');
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
     * @tc.number		SUB_WMS_GETALLDISPLAY_JSAPI_001
     * @tc.name			Test getAllDisplay_Test_001.
     * @tc.desc			To verify the function of obtaining all screens.
     */
    it('getAllDisplay_Test_001', 0, async function (done) {
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
     * @tc.number    SUB_WMS_GETALLDISPLAY_JSAPI_002
     * @tc.name      Test getAllDisplay_Test_002
     * @tc.desc      To test the function if obtaining the default screen
     */
    it('getAllDisplay_Test_002', 0, async function (done) {
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
     * @tc.number		SUB_WMS_GETDEFALUTDISPLAYSYNC_JSAPI_001
     * @tc.name			Test getDefaultDisplaySYNC_Test_001
     * @tc.desc			To test the sync function of obtaining the default display
     */
    it('getDefaultDisplaySync_Test_001', 0, async function (done) {
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
     * @tc.number	SUB_WMS_ENUM_WINDOWDisplayState_JSAPI_001
     * @tc.name	    Test enumWindowDisplayState_Test_001.
     * @tc.desc		To test the enum value of WindowDisplayState.
    */
    it('enumWindowDisplayState_Test_001', 0, async function (done) {
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
     * @tc.number	SUB_WMS_WATERFALLDISPLAYAREARECTS_JSAPI_001
     * @tc.name	    Test waterfallDisplayAreaRects_Test_001.
     * @tc.desc		To test value of waterfallDisplayAreaRects.
    */
    it('waterfallDisplayAreaRects_Test_001', 0, async function (done) {
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
    * @tc.number	SUB_WMS_RECT_JSAPI_001
    * @tc.name	    Test RECT_Test_001.
    * @tc.desc		To test value of RECT.
    */
    it('displayAreaRects_Test_001', 0, async function (done) {
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
     * @tc.number	SUB_WMS_CutoutInfo_JSAPI_001
     * @tc.name	    Test CutoutInfo_Test_001.
     * @tc.desc		To test value of CutoutInfo.
    */
    it('CutoutInfo_Test_001', 0, async function (done) {
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
     * @tc.number		SUB_WMS_GETDISPLAYCUtOUTINFO_JSAPI_001
     * @tc.name			Test getDisplayCutoutInfo_Test_001
     * @tc.desc			To test the function of getCutoutInfo
     */
    it('getDisplayCutoutInfo_Test_001', 0, async function (done) {
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
     * @tc.number		SUB_WMS_GETDISPLAYCUtOUTINFO_JSAPI_002
     * @tc.name			Test getDisplayCutoutInfo_Test_002
     * @tc.desc			To test the function of getCutoutInfo
    */
    it('getDisplayCutoutInfo_Test_002', 0, async function (done) {
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


})
}
