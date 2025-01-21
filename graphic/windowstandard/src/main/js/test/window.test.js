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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium'
import window from '@ohos.window'
import display from '@ohos.display'

const TRUE_WINDOW = true;
const avoidAreaType = 3;

export default function window_test() {
    describe('window_test', function () {
        var wnd;
        var topWindow;
        const DELAY_TIME = 3000;
        var height;

        function windowSizeChangeCallback(data) {
            console.log('windowTest OnOffTest1 callback  ' + JSON.stringify(data));
            height = data.height;
        }

        function systemAvoidAreaChangeCallback(data) {
            console.log('windowTest OnOffTest2 callback  ' + JSON.stringify(data));
            height = data.bottomRect.height;
        }

        beforeAll(function (done) {
            console.log('windowTest beforeAll begin');
            window.getTopWindow().then(wnd => {
                console.log('windowTest beforeAll window.getTopWindow wnd: ' + wnd);
                if (wnd) {
                    topWindow = wnd;
                } else {
                    console.log('windowTest beforeAll window.getTopWindow empty');
                }
            }, (err) => {
                console.log('windowTest beforeAll window.getTopWindow failed, err : ' + JSON.stringify(err));
            })
            setTimeout(() => {
                done();
            }, 5000);
        })
        beforeEach(function (done) {
            if (topWindow) {
                topWindow.show().then(() => {
                    console.log('windowTest beforeEach wnd.show success');
                    topWindow.getProperties().then(data => {
                        if (data.isFullScreen) {
                            topWindow.setFullScreen(false).then(() => {
                                console.log('windowTest beforeEach wnd.setFullScreen(false) success');
                            }, (err) => {
                                console.log('windowTest beforeEach wnd.getProperties failed, err : ' + JSON.stringify(err));
                            })
                        }
                    }, (err) => {
                        console.log('windowTest beforeEach wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
                    })
                }, (err) => {
                    console.log('windowTest beforeEach wnd.show failed, err : ' + JSON.stringify(err));
                })
                setTimeout(() => {
                    done();
                }, DELAY_TIME);
            } else {
                done();
            }
        })
        afterEach(function () {
        })
        afterAll(function () {
        })

        /**
	 * @tc.number     SUB_WMS_GETPROPERTIES_JSAPI_001
	 * @tc.name       Test getProperties_Test_001
	 * @tc.desc       Get the current application main window properties
	 */
        it('getProperties_Test_001', 0, async function (done) {
            let msgStr = 'getProperties_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getProperties().then((data) => {
                    console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                    expect(data.type != null).assertTrue();
                    expect(data.windowRect.height != null).assertTrue();
                    expect(data.windowRect.left != null).assertTrue();
                    expect(data.windowRect.top != null).assertTrue();
                    expect(data.windowRect.width != null).assertTrue();
                    expect(!data.isFullScreen).assertTrue();
                    expect(!data.isLayoutFullScreen).assertTrue();
                    expect(data.focusable).assertTrue();
                    expect(data.touchable).assertTrue();
                    expect(!data.isKeepScreenOn).assertTrue();
                    expect(!data.isTransparent).assertTrue();
                    expect(data.brightness != null).assertTrue();
                    expect(data.dimBehindValue).assertEqual(0);
                    expect(!data.isRoundCorner).assertTrue();
                    expect(!data.isPrivacyMode).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
        * @tc.number    SUB_WMS_GETPROPERTIES_JSAPI_002
        * @tc.name      Test getProperties_Test_002
        * @tc.desc      Get the current application main window properties
        */
        it('getProperties_Test_002', 0, async function (done) {
            let msgStr = 'getProperties_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getProperties((err, data) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' window.getProperties callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        expect(data.type != null).assertTrue();
                        expect(data.windowRect.height != null).assertTrue();
                        expect(data.windowRect.left != null).assertTrue();
                        expect(data.windowRect.top != null).assertTrue();
                        expect(data.windowRect.width != null).assertTrue();
                        expect(!data.isFullScreen).assertTrue();
                        expect(!data.isLayoutFullScreen).assertTrue();
                        expect(data.focusable).assertTrue();
                        expect(data.touchable).assertTrue();
                        expect(!data.isKeepScreenOn).assertTrue();
                        expect(!data.isTransparent).assertTrue();
                        expect(data.brightness != null).assertTrue();
                        expect(data.dimBehindValue).assertEqual(0);
                        expect(!data.isRoundCorner).assertTrue();
                        expect(!data.isPrivacyMode).assertTrue();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_GETAVOIDAREA_JSAPI_001
	 * @tc.name       Test getAvoidArea_Test_001
	 * @tc.desc       Get SystemUI type avoidance area
	 */
        it('getAvoidArea_Test_001', 0, async function (done) {
            let msgStr = 'getAvoidArea_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM).then((data) => {
                    console.log(msgStr + ' wnd.getAvoidArea success, data :' + JSON.stringify(data));
                    expect(data.visible).assertTrue();
                    expect(data.rightRect != null).assertTrue();
                    expect(data.topRect != null).assertTrue();
                    expect(data.bottomRect != null).assertTrue();
                    expect(data.leftRect != null).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.getAvoidArea failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_GETAVOIDAREA_JSAPI_002
	 * @tc.name       Test getAvoidArea_Test_002
	 * @tc.desc       Get Notch type avoidance area
	 */
        it('getAvoidArea_Test_002', 0, async function (done) {
            let msgStr = 'getAvoidArea_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(window.AvoidAreaType.TYPE_CUTOUT).then((data) => {
                    console.log(msgStr + ' wnd.getAvoidArea success, data :' + JSON.stringify(data));
                    expect(!data.visible).assertTrue();
                    expect(data.rightRect != null).assertTrue();
                    expect(data.topRect != null).assertTrue();
                    expect(data.bottomRect != null).assertTrue();
                    expect(data.leftRect != null).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.getAvoidArea failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_GETAVOIDAREA_JSAPI_003
	 * @tc.name       Test getAvoidArea_Test_003
	 * @tc.desc       Get system gesture type avoidance area
	 */
        it('getAvoidArea_Test_003', 0, async function (done) {
            let msgStr = 'getAvoidArea_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(avoidAreaType).then((data) => {
                    console.log(msgStr + ' wnd.getAvoidArea success, data :' + JSON.stringify(data));
                    expect(data.visible).assertTrue();
                    expect(data.rightRect != null).assertTrue();
                    expect(data.topRect != null).assertTrue();
                    expect(data.bottomRect != null).assertTrue();
                    expect(data.leftRect != null).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.getAvoidArea failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log('windowTest getAvoidAreaTest3 window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_GETAVOIDAREA_JSAPI_004
     * @tc.name      Test getAvoidArea_Test_004
     * @tc.desc      Get System type avoidance area
     */
        it('getAvoidArea_Test_004', 0, async function (done) {
            let msgStr = 'getAvoidArea_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(window.AvoidAreaType.TYPE_SYSTEM, (err, data) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.getAvoidArea callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        expect(data.visible).assertTrue();
                        expect(data.topRect != null).assertTrue();
                        expect(data.rightRect != null).assertTrue();
                        expect(data.bottomRect != null).assertTrue();
                        expect(data.leftRect != null).assertTrue();
                        done();
                    }
                })
            })
        })

        /**
     * @tc.number    SUB_WMS_GETAVOIDAREA_JSAPI_005
     * @tc.name      Test getAvoidArea_Test_005
     * @tc.desc      Get Cutout type avoidance area
     */
        it('getAvoidArea_Test_005', 0, async function (done) {
            let msgStr = 'getAvoidArea_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(window.AvoidAreaType.TYPE_CUTOUT, (err, data) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.getAvoidArea callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        expect(!data.visible).assertTrue();
                        expect(data.topRect != null).assertTrue();
                        expect(data.rightRect != null).assertTrue();
                        expect(data.bottomRect != null).assertTrue();
                        expect(data.leftRect != null).assertTrue();
                        console.log(msgStr + ' wnd.getAvoidArea callback end');
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_GETAVOIDAREA_JSAPI_006
     * @tc.name      Test getAvoidArea_Test_006
     * @tc.desc      Get system gesture type avoidance area
     */
        it('getAvoidArea_Test_006', 0, async function (done) {
            let msgStr = 'getAvoidArea_Test_006';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(avoidAreaType, (err, data) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.getAvoidArea callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        expect(data.visible).assertTrue();
                        expect(data.topRect != null).assertTrue();
                        expect(data.rightRect != null).assertTrue();
                        expect(data.bottomRect != null).assertTrue();
                        expect(data.leftRect != null).assertTrue();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_SETFULLSCREEN_JSAPI_001
	 * @tc.name       Test setFullScreen_Test_001
	 * @tc.desc       Set the window to be non-fullscreen first and then fullscreen
	 */
        it('setFullScreen_Test_001', 0, async function (done) {
            let msgStr = 'setFullScreen_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(false).then(() => {
                    wnd.getProperties().then((data) => {
                        console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                        expect(data != null).assertTrue();
                        expect(!data.isFullScreen).assertTrue();
                        wnd.setFullScreen(true).then(() => {
                            wnd.getProperties().then((data) => {
                                console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                                expect(data != null).assertTrue();
                                expect(data.isFullScreen).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' wnd.setFullScreen(true) failed, err : ' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_SETFULLSCREEN_JSAPI_002
     * @tc.name      Test setFullScreen_Test_002
     * @tc.desc      Set the window to be non-fullscreen first and then fullscreen.
     */
        it('setFullScreen_Test_002', 0, async function (done) {
            let msgStr = 'setFullScreen_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(false, (err) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' window.setFullScreen(false) callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' window.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                expect(!data.isFullScreen).assertTrue();
                                wnd.setFullScreen(true, (err) => {
                                    if (err.code != 0) {
                                        console.log(msgStr + ' window.setFullScreen(true) callback fail' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        wnd.getProperties((err, data) => {
                                            if (err.code != 0) {
                                                console.log(msgStr + ' window.getProperties callback fail' + JSON.stringify(err));
                                                expect().assertFail();
                                                done();
                                            } else {
                                                expect(data.isFullScreen).assertTrue();
                                                console.log(msgStr + ' window.getProperties callback end');
                                                done();
                                            }
                                        })
                                    }
                                })
                            }
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow fail : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_001
	 * @tc.name       Test setLayoutFullScreen_Test_001
	 * @tc.desc       Set window and layout to full screen
	 */
        it('setLayoutFullScreen_Test_001', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(true).then(() => {
                    wnd.getProperties().then((data) => {
                        console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                        expect(data.isFullScreen).assertTrue();
                        wnd.setLayoutFullScreen(true).then(() => {
                            wnd.getProperties().then((data) => {
                                console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                                expect(data != null).assertTrue();
                                expect(data.isLayoutFullScreen).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' wnd.setLayoutFullScreen(true) failed, err : ' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                        expect().assertFail();
                    })
                }, (err) => {
                    console.log(msgStr + ' wnd.setFullScreen(true) failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_002
     * @tc.name      Test setLayoutFullScreen_Test_002
     * @tc.desc      Set window and layout to full screen.
     */
        it('setLayoutFullScreen_Test_002', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(true, (err) => {
                    console.log(msgStr + ' wnd.setFullScreen(true) callback begin');
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.setFullScreen callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' wnd.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                expect(data.isFullScreen).assertTrue();
                                wnd.setLayoutFullScreen(true, (err) => {
                                    if (err.code != 0) {
                                        console.log(msgStr + ' wnd.setLayoutFullScreen callback fail' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        wnd.getProperties((err, data) => {
                                            if (err.code != 0) {
                                                console.log(msgStr + ' wnd.getProperties callback fail' + JSON.stringify(err));
                                                expect().assertFail();
                                                done();
                                            } else {
                                                console.log(msgStr + ' wnd.getProperties callback end');
                                                expect(data.isLayoutFullScreen).assertTrue();
                                                done();
                                            }
                                        })
                                    }
                                })
                            }

                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow fail : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_003
	 * @tc.name       Test setLayoutFullScreen_Test_003
	 * @tc.desc       Set the window to full screen, the layout is not full screen
	 */
        it('setLayoutFullScreen_Test_003', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(true).then(() => {
                    wnd.getProperties().then((data) => {
                        console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                        expect(data.isFullScreen).assertTrue();
                        wnd.setLayoutFullScreen(false).then(() => {
                            wnd.getProperties().then((data) => {
                                console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                                expect(data != null).assertTrue();
                                expect(!data.isLayoutFullScreen).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' wnd.setLayoutFullScreen(false) failed, err : ' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                        expect().assertFail();
                    })
                }, (err) => {
                    console.log(msgStr + ' wnd.setFullScreen(true) failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_004
     * @tc.name      Test setLayoutFullScreen_Test_004
     * @tc.desc      Set the window to full screen, the layout is not full screen
     */
        it('setLayoutFullScreen_Test_004', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(true, (err) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.setFullScreen(true) callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' wnd.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                expect(data.isFullScreen).assertTrue();
                                wnd.setLayoutFullScreen(false, (err) => {
                                    if (err.code != 0) {
                                        console.log(msgStr + ' wnd.setLayoutFullScreen(false) callback fail' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        wnd.getProperties((err, data) => {
                                            if (err.code != 0) {
                                                console.log(msgStr + ' wnd.getProperties callback fail' + JSON.stringify(err));
                                                expect().assertFail();
                                                done();
                                            } else {
                                                console.log(msgStr + ' wnd.getProperties callback end');
                                                expect(!data.isLayoutFullScreen).assertTrue();
                                                done();
                                            }
                                        })
                                    }
                                })
                            }
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow fail : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_005
	 * @tc.name       Test setLayoutFullScreen_Test_005
	 * @tc.desc       Set the window to be non-full-screen and the layout to be full-screen
	 */
        it('setLayoutFullScreen_Test_005', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(false).then(() => {
                    wnd.getProperties().then((data) => {
                        console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                        expect(data != null).assertTrue();
                        expect(!data.isFullScreen).assertTrue();
                        wnd.setLayoutFullScreen(true).then(() => {
                            wnd.getProperties().then((data) => {
                                console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                                expect(data.isLayoutFullScreen).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' wnd.setLayoutFullScreen(true) failed, err : ' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_006
     * @tc.name      Test setLayoutFullScreen_Test_006
     * @tc.desc      Set the window to be non-full-screen and the layout to be full-screen.
     */
        it('setLayoutFullScreen_Test_006', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_006';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(false, (err) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.setFullScreen fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' wnd.getProperties fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                expect(!data.isFullScreen).assertTrue();
                                wnd.setLayoutFullScreen(true, (err) => {
                                    if (err.code != 0) {
                                        console.log(msgStr + ' wnd.setLayoutFullScreen fail' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        wnd.getProperties((err, data) => {
                                            if (err.code != 0) {
                                                console.log(msgStr + ' wnd.getProperties fail' + JSON.stringify(err));
                                                expect().assertFail();
                                                done();
                                            } else {
                                                expect(data.isLayoutFullScreen).assertTrue();
                                                done();
                                            }
                                        })
                                    }
                                })
                            }
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow fail : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_007
	 * @tc.name       Test setLayoutFullScreen_Test_007
	 * @tc.desc       Setting windows and layouts to be non-fullscreen
	 */
        it('setLayoutFullScreen_Test_007', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_007';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(false).then(() => {
                    wnd.getProperties().then((data) => {
                        console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                        expect(!data.isFullScreen).assertTrue();
                        wnd.setLayoutFullScreen(false).then(() => {
                            wnd.getProperties().then((data) => {
                                console.log(msgStr + ' wnd.getProperties success, data : ' + JSON.stringify(data));
                                expect(!data.isLayoutFullScreen).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' wnd.setLayoutFullScreen(false) failed, err : ' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' wnd.getProperties failed, err : ' + JSON.stringify(err));
                        expect().assertFail();
                    })
                }, (err) => {
                    console.log(msgStr + ' wnd.setFullScreen(false) failed, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_SETLAYOUTFULLSCREEN_JSAPI_008
     * @tc.name      Test setLayoutFullScreen_Test_008
     * @tc.desc      Setting window and layouts to be non-fullscreen.
     */
        it('setLayoutFullScreen_Test_008', 0, async function (done) {
            let msgStr = 'setLayoutFullScreen_Test_008';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFullScreen(false, (err) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' window.setFullScreen callback fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getProperties((err, data) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' window.getProperties callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                expect(!data.isFullScreen).assertTrue();
                                wnd.setLayoutFullScreen(false, (err) => {
                                    if (err.code != 0) {
                                        console.log(msgStr + ' window.setLayoutFullScreen callback fail' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        wnd.getProperties((err, data) => {
                                            if (err.code != 0) {
                                                console.log(msgStr + ' window.getProperties callback fail' + JSON.stringify(err));
                                                expect().assertFail();
                                                done();
                                            } else {
                                                expect(!data.isLayoutFullScreen).assertTrue();
                                                done();
                                            }
                                        })
                                    }
                                })
                            }
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' window.getTopWindow fail : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })


        /**
	 * @tc.number     SUB_WMS_FIND_JSAPI_001
	 * @tc.name       Test find_Test_001
	 * @tc.desc       Query main window
	 */
        it('find_Test_001', 0, async function (done) {
            let msgStr = 'find_Test_001';
            console.log(msgStr + ' begin');
            window.find('window0').then((data) => {
                console.log(msgStr + ' wnd.find success, data : ' + JSON.stringify(data));
                expect(data != null).assertTrue();
                done();
            }, (err) => {
                console.log(msgStr + ' wnd.find failed, err : ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	 * @tc.number     SUB_WMS_FIND_JSAPI_002
	 * @tc.name       Test find_Test_002
	 * @tc.desc       Query for non-existing windows
	 */
        it('find_Test_002', 0, async function (done) {
            let msgStr = 'find_Test_002';
            console.log(msgStr + ' begin');
            window.find('window').then((window) => {
                console.log(msgStr + ' wnd.find success, window : ' + JSON.stringify(window));
                expect().assertFail();
                done();
            }, (err) => {
                console.log(msgStr + ' wnd.find failed, err : ' + JSON.stringify(err));
                expect(TRUE_WINDOW).assertTrue();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_FIND_JSAPI_004
     * @tc.name      Test find_Test_003
     * @tc.desc      Query main window.
     */
        it('find_Test_003', 0, async function (done) {
            let msgStr = 'find_Test_003';
            console.log(msgStr + ' begin');
            window.find('window0', (err, data) => {
                if (err.code) {
                    console.log(msgStr + ' wnd.find fail, err : ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    console.log(msgStr + ' wnd.find fail');
                    expect(data != null).assertTrue();
                    done();
                }
            })
        })

        /**
     * @tc.number    SUB_WMS_FIND_JSAPI_004
     * @tc.name      Test find_Test_004
     * @tc.desc      Query for non-existing windows
     */
        it('find_Test_004', 0, async function (done) {
            let msgStr = 'find_Test_004';
            console.log(msgStr + ' begin');
            window.find('window', (err, data) => {
                if (err.code) {
                    console.log(msgStr + ' wnd.find fail, err : ' + JSON.stringify(err));
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                } else {
                    console.log(msgStr + ' wnd.find success');
                    expect().assertFail();
                    done();
                }
            })
        })


        /**
     * @tc.number    SUB_WMS_ONOFF_JSAPI_001
     * @tc.name      Test onOff_Test_001.
     * @tc.desc      To verify the function of enabling and disabling intercepting when the window size changes.
     */
        it('onOff_Test_001', 0, async function (done) {
            let msgStr = 'onOff_Test_001';
            console.log(msgStr + ' begin');
            display.getDefaultDisplay().then(dsp => {
                window.getTopWindow((err, data) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' getTopWindow  fail ' + JSON.stringify(err.code));
                        expect().assertFail();
                        done();
                    } else {
                        expect(data != null).assertTrue();
                        data.on('windowSizeChange', windowSizeChangeCallback);
                        data.setLayoutFullScreen(true, (err) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' setLayoutFullScreen  fail ' + JSON.stringify(err.code));
                                expect().assertFail();
                                done();
                            } else {
                                setTimeout((async function () {
                                    expect(dsp.height == height).assertTrue();
                                    data.off('windowSizeChange');
                                    data.setLayoutFullScreen(false, (err) => {
                                        if (err.code != 0) {
                                            console.log(msgStr + ' setLayoutFullScreen callback fail ' + JSON.stringify(err));
                                            expect().assertFail();
                                            done();
                                        } else {
                                            expect(dsp.height == height).assertTrue();
                                            done();
                                        }
                                    })
                                }), 3000)
                            }
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getDefaultDisplay failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_ONOFF_JSAPI_002
     * @tc.name      Test onOff_Test_002
     * @tc.desc      To verify the function of enabling and disabling lawful interception in the system and window
     */
        it('onOff_Test_002', 0, async function (done) {
            let msgStr = 'onOff_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow((err, data) => {
                if (err.code != 0) {
                    console.log(msgStr + ' getTopWindow callback fail ' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    expect(data != null).assertTrue();
                    data.on('systemAvoidAreaChange', systemAvoidAreaChangeCallback);
                    data.setFullScreen(true, (err) => {
                        if (err.code != 0) {
                            console.log(msgStr + ' setLayoutFullScreen callback fail ' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        } else {
                            setTimeout((async function () {
                                expect(height == 0).assertTrue();
                                data.off('systemAvoidAreaChange');
                                data.setFullScreen(false, (err) => {
                                    if (err.code != 0) {
                                        console.log(msgStr + ' setLayoutFullScreen callback fail ' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        console.log(msgStr + ' off callback success');
                                        expect(height == 0).assertTrue();
                                        done();
                                    }
                                })
                            }), 3000)
                        }
                    })
                }
            })
        })

        /**
     * @tc.number      SUB_WMS_ISSHOWING_JSAPI_001
     * @tc.name        Test isShowing_Test_001.
     * @tc.desc        To verify the function of obtaining the display status when a window is hidden and then displayed.
     */
        it('isShowing_Test_001', 0, async function (done) {
            let msgStr = 'isShowing_Test_001';
            console.log(msgStr + ' begin');
            window.create('subWindow1', window.WindowType.TYPE_APP).then(wnd => {
                expect(wnd != null).assertTrue();
                console.log(msgStr + ' wnd.resetSize(400, 400) begin');
                wnd.resetSize(400, 400).then(() => {
                    console.log(msgStr + ' wnd.resetSize(400, 400) success');
                    wnd.isShowing().then(res => {
                        console.log(msgStr + ' wnd.isShowing data:' + res);
                        expect(!res).assertTrue();
                        wnd.show().then(() => {
                            wnd.isShowing().then(res => {
                                expect(res).assertTrue();
                                wnd.destroy((err) => {
                                    if (err.code) {
                                        console.error(msgStr + ' Failed to destroy the window. err:' + JSON.stringify(err));
                                        return;
                                    }
                                    console.info('Succeeded in destroying the window.');
                                });
                                done();
                            }, (err) => {
                                console.log(msgStr + ' wnd.isShowing failed, err :' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' wnd.show failed, err :' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' wnd.isShowing failed, err :' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err_resetSize) => {
                    console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err_resetSize));
                })
            })
        })

        /**
     * @tc.number    SUB_WMS_ISSHOWING_JSAPI_002
     * @tc.name      Test isShowing_Test_002.
     * @tc.desc      To verify the function of obtaining the display status when a window is hidden and then displayed.
     */
        it('isShowing_Test_002', 0, async function (done) {
            let msgStr = 'isShowing_Test_002';
            console.log(msgStr + ' begin');
            window.create('subWindow2', window.WindowType.TYPE_APP, (err, data) => {
                if (err.code) {
                    console.log(msgStr + ' window.create fail err ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(data != null).assertTrue();
                    data.resetSize(400, 400).then(() => {
                        console.log(msgStr + ' wnd.resetSize(400, 400) success');
                        data.isShowing((err, res1) => {
                            if (err.code) {
                                console.log(msgStr + ' data.isShowing fail err ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                expect(!res1).assertTrue();
                                data.show(() => {
                                    if (err.code) {
                                        console.log(msgStr + ' data.show fail err ' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        data.isShowing((err, res2) => {
                                            if (err.code) {
                                                console.log(msgStr + ' data.show fail err ' + JSON.stringify(err));
                                                expect().assertFail();
                                                done();
                                            } else {
                                                expect(res2).assertTrue();
                                                data.destroy().then(() => {
                                                    console.info(msgStr + 'Succeeded in destroying the window.');
                                                    done();
                                                }).catch((err) => {
                                                    console.error(msgStr + 'Failed to destroy the window. err: ' + JSON.stringify(err));
                                                });
                                            }
                                        })
                                    }
                                })
                            }
                        })
                    }, (err_resetSize) => {
                        console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err_resetSize));
                    })

                }
            })
        })

        /**
     * @tc.number      SUB_WMS_SETCOLORSPACE_JSAPI_001
     * @tc.name        Test setColorSpace_Test_001
     * @tc.desc        To verify the setting of the wide color gamut color space
     */
        it('setColorSpace_Test_001', 0, async function (done) {
            let msgStr = 'setColorSpace_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setColorSpace(window.ColorSpace.WIDE_GAMUT).then(() => {
                    console.log(msgStr + ' setColorSpace WIDE_GAMUT');
                    wnd.getColorSpace().then(res => {
                        expect(res == window.ColorSpace.WIDE_GAMUT).assertTrue();
                        console.log(msgStr + ' setColorSpace WIDE_GAMUT success');
                        wnd.isSupportWideGamut().then(data => {
                            expect(data).assertTrue();
                            done();
                        }, (err) => {
                            console.log(msgStr + ' wnd.isSupportWideGamut failed, err :' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' wnd.getColorSpace failed, err :' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' wnd.setColorSpace failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number      SUB_WMS_SETCOLORSPACE_JSAPI_002
     * @tc.name        Test setColorSpace_Test_002
     * @tc.desc        To verify that the color space of invaild values is set successfully
     */
        it('setColorSpace_Test_002', 0, async function (done) {
            let msgStr = 'setColorSpace_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setColorSpace(-5).then(() => {
                    console.log(msgStr + ' setColorSpace -5');
                    expect().assertFail();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.setColorSpace failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' wnd.getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_SETCOLORSPACE_JSAPI_003
     * @tc.name      Test setColorSpace_Test_003
     * @tc.desc      To verify the setting of the wide color gamut color space
     */
        it('setColorSpace_Test_003', 0, async function (done) {
            let msgStr = 'setColorSpace_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setColorSpace(window.ColorSpace.WIDE_GAMUT, (err) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' setColorSpace  fail' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getColorSpace((err, data) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' getColorSpace  fail ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                expect(data == window.ColorSpace.WIDE_GAMUT).assertTrue();
                                wnd.isSupportWideGamut((err, data) => {
                                    if (err.code != 0) {
                                        console.log(msgStr + ' getColorSpace callback fail' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    } else {
                                        expect(data).assertTrue();
                                        done();
                                    }
                                })
                            }
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed,err: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_SETCOLORSPACE_JSAPI_004
     * @tc.name      Test setColorSpace_Test_004
     * @tc.desc      To verify that the color space of invalid values is set successfully
     */
        it('setColorSpace_Test_004', 0, async function (done) {
            let msgStr = 'setColorSpace_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setColorSpace(-5, (err) => {
                    console.log(msgStr + ' setColorSpace callback begin' + JSON.stringify(err));
                    if (err.code != 0) {
                        console.log(msgStr + ' setColorSpace callback fail' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed,err: ' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_CREATE_JSAPI_001
     * @tc.name			Test create_Test_001.
     * @tc.desc			To verify the function of creating an application subwindow.
     */
        it('create_Test_001', 0, async function (done) {
            let msgStr = 'create_Test_001';
            console.log(msgStr + ' begin');
            window.create('subWindow3', window.WindowType.TYPE_APP).then(wnd => {
                console.log(msgStr + ' create success wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.resetSize(400, 400).then(() => {
                    console.log(msgStr + ' wnd.resetSize(400, 400) success');
                    wnd.destroy().then(() => {
                        console.info(msgStr + 'Succeeded in destroying the window.');
                        done();
                    }).catch((err) => {
                        console.error(msgStr + 'Failed to destroy the window. err: ' + JSON.stringify(err));
                    });
                }, (err_resetSize) => {
                    console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err_resetSize));
                })

            }, (err) => {
                console.log(msgStr + ' create failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_CREATE_JSAPI_001
     * @tc.name      Test create_Test_002
     * @tc.desc      To verify the function of creating an application subwindow
     */
        it('create_Test_002', 0, async function (done) {
            let msgStr = 'create_Test_002';
            console.log(msgStr + ' begin');
            window.create('subWindow4', window.WindowType.TYPE_APP, (err, data) => {
                if (err.code != 0) {
                    console.log(msgStr + ' create callback fail' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    expect(data != null).assertTrue();
                    console.log(msgStr + ' callback create success data' + data);
                    data.resetSize(400, 400).then(() => {
                        console.log(msgStr + ' wnd.resetSize(400, 400) success');
                        data.destroy().then(() => {
                            console.info(msgStr + 'Succeeded in destroying the window.');
                            done();
                        }).catch((err) => {
                            console.error(msgStr + 'Failed to destroy the window. err: ' + JSON.stringify(err));
                        });
                    }, (err_resetSize) => {
                        console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err_resetSize));
                    })
                }
            })
        })

        /**
     * @tc.number		SUB_WMS_DESTROY_JSAPI_001
     * @tc.name			Test destroy_Test_001
     * @tc.desc			Verify that a window is destroyed after being created
     */
        it('destroy_Test_001', 0, async function (done) {
            let msgStr = 'destroy_Test_001';
            console.log(msgStr + ' begin');
            window.create('subWindow5', window.WindowType.TYPE_APP).then(wnd => {
                console.log(msgStr + ' create success wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.resetSize(400, 400).then(() => {
                    console.log(msgStr + ' wnd.resetSize(400, 400) success');
                    wnd.destroy().then(() => {
                        window.find('subWindow5').then((data) => {
                            console.log(msgStr + ' window.find success, window :' + JSON.stringify(data));
                            expect().assertFail();
                            done();
                        }, (err) => {
                            console.log(msgStr + ' find failed, err :' + JSON.stringify(err));
                            expect(err.code).assertEqual(1001);
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' destroy failed, err :' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err_resetSize) => {
                    console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err_resetSize));
                })

            }, (err) => {
                console.log(msgStr + ' create failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })
        /**
     * @tc.number    SUB_WMS_DESTROY_JSAPI_002
     * @tc.name      Test destroy_Test_002
     * @tc.desc      Verify that a window is destroyed after being created
     */
        it('destroy_Test_002', 0, async function (done) {
            let msgStr = 'destroy_Test_002';
            console.log(msgStr + ' begin');
            window.create('subWindow6', window.WindowType.TYPE_APP, (err, data) => {
                if (err.code != 0) {
                    console.log(msgStr + ' create callback fail' + JSON.stringify(err.code));
                    expect().assertFail();
                    done();
                } else {
                    expect(data != null).assertTrue();
                    data.resetSize(400, 400).then(() => {
                        console.log(msgStr + ' wnd.resetSize(400, 400) success');
                        data.destroy((err) => {
                            if (err.code != 0) {
                                console.log(msgStr + ' create callback fail' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                window.find('subWindow6', (err, data) => {
                                    console.log(msgStr + ' find callback begin' + JSON.stringify(data));
                                    if (err.code != 0) {
                                        console.log(msgStr + ' find callback fail' + JSON.stringify(err.code));
                                        expect(err.code).assertEqual(1001);
                                        done();
                                    } else {
                                        console.log(msgStr + ' find suceess,err : ' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    }
                                })
                            }
                        })
                    }, (err_resetSize) => {
                        console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err_resetSize));
                    })

                }
            })
        })

        /**
     * @tc.number		SUB_WMS_SETSYSTEMBARENABLE_JSAPI_001
     * @tc.name			Test setSystemBarEnable_Test_001
     * @tc.desc			To verify the function of setting a scenario that is visible to the system bar
     */
        it('setSystemBarEnable_Test_001', 0, async function (done) {
            let msgStr = 'setSystemBarEnable_Test_001';
            console.log(msgStr + ' begin');
            var names = ["status", "navigation"];
            window.getTopWindow().then(wnd => {
                expect(wnd != null).assertTrue();
                wnd.setLayoutFullScreen(true).then(() => {
                    wnd.setSystemBarEnable(names).then(() => {
                        console.log(msgStr + ' setSystemBarEnable success');
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' setSystemBarEnable failed, err :' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setLayoutFullScreen failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })


        /**
     * @tc.number    SUB_WMS_SETSYSTEMBARENABLE_JSAPI_002
     * @tc.name      Test setSystemBarEnable_Test_002
     * @tc.desc      To verify the function of setting a scenario that is visible to the system bar
     */
        it('setSystemBarEnable_Test_002', 0, async function (done) {
            let msgStr = 'setSystemBarEnable_Test_002';
            console.log(msgStr + ' begin');
            var names = ["status", "navigation"];
            window.getTopWindow((err, data) => {
                if (err.code != 0) {
                    console.log(msgStr + ' getTopWindow fail: ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(data != null).assertTrue();
                    data.setSystemBarEnable(names, (err) => {
                        if (err.code != 0) {
                            console.log(msgStr + ' getTopWindow fail' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        } else {
                            console.log(msgStr + ' setSystemBarEnable success');
                            expect(TRUE_WINDOW).assertTrue();
                            done();
                        }
                    })
                }
            })
        })

        /**
     * @tc.number		SUB_WMS_SETSYSTEMBARPROPERTIES_JSAPI_001
     * @tc.name			Test setSystemBarProperties_Test_001
     * @tc.desc			To verify the function of setting system bar attributes
     */
        it('setSystemBarProperties_Test_001', 0, async function (done) {
            let msgStr = 'setSystemBarProperties_Test_001';
            console.log(msgStr + ' begin');
            var SystemBarProperties = {
                statusBarColor: '#ff00ff',
                navigationBarColor: '#00ff00',
                isStatusBarLightIcon: true,
                isNavigationBarLightIcon: false,
                statusBarContentColor: '#ffffff',
                navigationBarContentColor: '#00ffff'
            };
            window.getTopWindow().then(wnd => {
                expect(wnd != null).assertTrue();
                wnd.setSystemBarProperties(SystemBarProperties).then(() => {
                    console.log(msgStr + ' setSystemBarProperties success ');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' setSystemBarProperties failed, err :' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })


        /**
     * @tc.number    SUB_WMS_SETSYSTEMBARPROPERTIES_JSAPI_002
     * @tc.name      Test setSystemBarProperties_Test_002
     * @tc.desc      To verify the function of setting system bar attributes
     */
        it('setSystemBarProperties_Test_002', 0, async function (done) {
            let msgStr = 'setSystemBarProperties_Test_002';
            console.log(msgStr + ' begin');
            var SystemBarProperties = {
                statusBarColor: '#ff00ff',
                navigationBarColor: '#00ff00',
                isStatusBarLightIcon: true,
                isNavigationBarLightIcon: false,
                statusBarContentColor: '#ffffff',
                navigationBarContentColor: '#00ffff'
            };
            window.getTopWindow((err, data) => {
                if (err.code != 0) {
                    console.log(msgStr + ' getTopWindow fail: ' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                } else {
                    expect(data != null).assertTrue();
                    data.setSystemBarProperties(SystemBarProperties, (err) => {
                        if (err.code != 0) {
                            console.log(msgStr + ' setSystemBarProperties fail' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        } else {
                            expect(TRUE_WINDOW).assertTrue();
                            done();
                        }
                    })
                }
            })
        })


        /**
     * @tc.number    SUB_WMS_MOVETO_JSAPI_001
     * @tc.name      Test move_Test_001
     * @tc.desc      Verify the scene where the window moves
     */
        it('move_Test_001', 0, function (done) {
            let msgStr = 'move_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.moveTo(200, 200, (err) => {
                    if (err.code) {
                        console.log(msgStr + ' moveTo callback fail' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(6);
                        done();
                    } else {
                        console.log(msgStr + ' moveTo callback success');
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }
                })
            })
        })
        /**
    * @tc.number     SUB_WMS_MOVETO_JSAPI_002
    * @tc.name       Test move_Test_002
    * @tc.desc       Verify the scene where the window moves
    */
        it('move_Test_002', 0, async function (done) {
            let msgStr = 'move_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.moveTo(100, 100).then(() => {
                    console.log(msgStr + ' wnd.moveTo success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.moveTo failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(6);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_MOVETO_JSAPI_003
    * @tc.name       Test move_Test_003
    * @tc.desc       Verify the scene where the window moves
    */
        it('move_Test_003', 0, async function (done) {
            let msgStr = 'move_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.moveTo(20000, 20000).then(() => {
                    console.log(msgStr + ' wnd.moveTo success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.moveTo failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(6);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_MOVETO_JSAPI_004
    * @tc.name       Test move_Test_004
    * @tc.desc       Verify the scene where the window moves
    */
        it('move_Test_004', 0, async function (done) {
            let msgStr = 'move_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.moveTo(-200, -200).then(() => {
                    console.log(msgStr + ' wnd.moveTo success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.moveTo failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(6);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_MOVETO_JSAPI_005
    * @tc.name       Test move_Test_005
    * @tc.desc       Verify that the window is moved into the normal scene
    */
        it('move_Test_005', 0, async function (done) {
            let msgStr = 'move_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                for (var i = 1; i <= 5; i++) {
                    wnd.moveTo(100, 100).then(() => {
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' wnd.moveTo failed, err :' + JSON.stringify(err));
                        expect(err.code).assertEqual(6);
                        done();
                    })
                }
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_MOVETO_JSAPI_006
    * @tc.name       Test move_Test_006
    * @tc.desc       Verify the scene where the window moves
    */
        it('move_Test_006', 0, async function (done) {
            let msgStr = 'move_Test_006';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.moveTo(-200, -200, (err) => {
                    if (err.code) {
                        console.log(msgStr + ' wnd.moveTo failed, err :' + JSON.stringify(err));
                        expect(err.code).assertEqual(6);
                        done();
                    } else {
                        console.log(msgStr + ' wnd.moveTo success');
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	* @tc.number    SUB_WMS_MOVETO_JSAPI_007
	* @tc.name      Test move_Test_007
	* @tc.desc      Verify the scene where the window moves
	*/
        it('move_Test_007', 0, async function (done) {
            let msgStr = 'move_Test_007';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.moveTo(-200, -200).then(() => {
                    console.log(msgStr + 'moveTo(-200,-200) success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' moveTo failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(6);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
	* @tc.number    SUB_WMS_MOVETO_JSAPI_008
	* @tc.name      Test move_Test_008
	* @tc.desc      Verify the scene where the window moves
	*/
        it('move_Test_008', 0, async function (done) {
            let msgStr = 'move_Test_008';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.moveTo(-200, 200).then(() => {
                    wnd.moveTo(200, -300).then(() => {
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' create failed, err :' + JSON.stringify(err));
                        expect(err.code).assertEqual(6);
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' create failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(6);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' create failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_RESETSIZE_JSAPI_001
    * @tc.name       Test resetSize_Test_001
    * @tc.desc       Verify the scene where the window resets size
    */
        it('resetSize_Test_001', 0, async function (done) {
            let msgStr = 'resetSize_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.resetSize(200, 600).then(() => {
                    console.log(msgStr + ' wnd.resetSize(200, 600) success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(6);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_RESETSIZE_JSAPI_002
    * @tc.name       Test resetSize_Test_002
    * @tc.desc       Verify the scene where the window resets size
    */
        it('resetSize_Test_002', 0, async function (done) {
            let msgStr = 'resetSize_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.resetSize(20000, 20000).then(() => {
                    console.log(msgStr + ' wnd.resetSize(20000, 20000) success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(6);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_RESETSIZE_JSAPI_003
    * @tc.name       Test resetSize_Test_003
    * @tc.desc       Verify the scene where the window resets size
    */
        it('resetSize_Test_003', 0, async function (done) {
            let msgStr = 'resetSize_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.resetSize(0, 0).then(() => {
                    console.log(msgStr + ' wnd.resetSize(0, 0) success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_RESETSIZE_JSAPI_004
    * @tc.name       Test resetSize_Test_004
    * @tc.desc       Verify the scene where the window resets size
    */
        it('resetSize_Test_004', 0, async function (done) {
            let msgStr = 'resetSize_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.resetSize(-1, -1).then(() => {
                    console.log(msgStr + ' wnd.resetSize(-1, -1) success');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_RESETSIZE_JSAPI_005
    * @tc.name       Test resetSize_Test_005
    * @tc.desc       Verify the scene where the window resets size
    */
        it('resetSize_Test_005', 0, async function (done) {
            let msgStr = 'resetSize_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                for (var i = 1; i <= 5; i++) {
                    wnd.resetSize(100, 100).then(() => {
                        console.log(msgStr + ' wnd.resetSize(100, 100) success, count:"%d\n"', i);
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' wnd.resetSize failed, err :' + JSON.stringify(err));
                        expect(err.code).assertEqual(6);
                        done();
                    })
                }
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number    SUB_WMS_RESETSIZETEST_JSAPI_006
     * @tc.name      Test resetSize_Test_006
     * @tc.desc      Verify the scene where the window resets size
     */
        it('resetSize_Test_006', 0, function (done) {
            let msgStr = 'resetSize_Test_006';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.resetSize(200, 200, (err) => {
                    if (err.code) {
                        console.log(msgStr + ' resetSize callback fail' + JSON.stringify(err.code));
                        expect(err.code).assertEqual(6);
                        done();
                    } else {
                        console.log(msgStr + ' resetSize callback success');
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }
                })
            })
        })

        /**
	* @tc.number    SUB_WMS_RESETSIZE_JSAPI_007
	* @tc.name      Test resetSize_Test_007
	* @tc.desc      Verify the scene where the window resets size
	*/
        it('resetSize_Test_007', 0, async function (done) {
            var width = 100;
            var height = 100;
            let msgStr = 'resetSize_Test_007';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                for (let i = 1; i <= 5; i++) {
                    width = width * i;
                    height = height * i;
                    wnd.resetSize(width, height).then(() => {
                        console.log(msgStr + '  resetSizeTestLoop success');
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' resetSizeLoop resetSize failed, err :' + JSON.stringify(err));
                        expect(err.code).assertEqual(6);
                        done();
                    })
                }
            }, (err) => {
                console.log(msgStr + ' resetSizeLoop getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number     SUB_WMS_GETTOPWINDOW_JSAPI_001
    * @tc.name       Test getTopWindow_Test_001
    * @tc.desc       Verify the scene that gets the top window
    */
        it('getTopWindow_Test_001', 0, async function (done) {
            let msgStr = 'getTopWindow_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                done();
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed, err :' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_ENUM_WINDOWSTAGEEVENTTYPE_JSAPI_001
     * @tc.name			Test enumWindowStageEventType_Test_001.
     * @tc.desc			To test the enum value of WindowStageEventType.
     */
        it('enumWindowStageEventType_Test_001', 0, async function (done) {
            let msgStr = 'enumWindowStageEventType_Test_001';
            console.log(msgStr + ' begin');
            try {
                expect(1).assertEqual(window.WindowStageEventType.SHOWN);
                expect(2).assertEqual(window.WindowStageEventType.ACTIVE);
                expect(3).assertEqual(window.WindowStageEventType.INACTIVE);
                expect(4).assertEqual(window.WindowStageEventType.HIDDEN);
                done();
            } catch (err) {
                console.log(msgStr + ' error ' + JSON.stringify(err));
            }
        })

        /**
    * @tc.number		SUB_WMS_ENUM_WINDOWCOLORSPACE_JSAPI_001
    * @tc.name			Test enumWindowCOLORSPACE_Test_001.
    * @tc.desc			To test the enum value of WindowCOLORSPACE.
    */
        it('enumWindowCOLORSPACE_Test_001', 0, async function (done) {
            let msgStr = 'enumWindowCOLORSPACE_Test_001';
            console.log(msgStr + ' begin');
            try {
                expect(0).assertEqual(window.ColorSpace.DEFAULT);
                expect(1).assertEqual(window.ColorSpace.WIDE_GAMUT);
                done();
            } catch (err) {
                console.log(msgStr + ' colorspace error ' + JSON.stringify(err));
            }
        })

        /**
     * @tc.number		SUB_WMS_ENUM_WINDOWTYPE_JSAPI_001
     * @tc.name			Test enumWindowType_Test_001.
     * @tc.desc			To test the enum value of WindowType.
     */
        it('enumWindowType_Test_001', 0, async function (done) {
            let msgStr = 'enumWindowType_Test_001';
            console.log(msgStr + ' begin');
            try {
                expect(0).assertEqual(window.WindowType.TYPE_APP);
                expect(1).assertEqual(window.WindowType.TYPE_SYSTEM_ALERT);
                done();
            } catch (err) {
                console.log(msgStr + ' WindowType error ' + JSON.stringify(err));
            }
        })

        /**
     * @tc.number	SUB_WMS_ENUM_WINDOWPROTERTIES_JSAPI_001
     * @tc.name	    Test enumWindowProperties_Test_001.
     * @tc.desc		To test the enum value of WindowProperties.
    */
        it('enumWindowProperties_Test_001', 0, async function (done) {
            let msgStr = 'enumWindowProperties_Test_001';
            console.log(msgStr + ' begin');
            try {
                var windowP = {
                    windowRect: {
                        left: 20,
                        top: 20,
                        width: 20,
                        height: 20
                    },
                    type: 0,
                    isFullScreen: false,
                    isLayoutFullScreen: false,
                    focusable: false,
                    touchable: false,
                    brightness: 0.5,
                    dimBehindValue: 3,
                    isKeepScreenOn: false,
                    isPrivacyMode: false,
                    isRoundCorner: false,
                    isTransparent: false
                }
                expect(20).assertEqual(windowP.windowRect.left);
                expect(20).assertEqual(windowP.windowRect.top);
                expect(20).assertEqual(windowP.windowRect.width);
                expect(20).assertEqual(windowP.windowRect.height);
                expect(0).assertEqual(windowP.type);
                expect(!windowP.isFullScreen).assertTrue();
                expect(!windowP.isLayoutFullScreen).assertTrue();
                expect(!windowP.focusable).assertTrue();
                expect(!windowP.touchable).assertTrue();
                expect(0.5).assertEqual(windowP.brightness);
                expect(3).assertEqual(windowP.dimBehindValue);
                expect(!windowP.isKeepScreenOn).assertTrue();
                expect(!windowP.isPrivacyMode).assertTrue();
                expect(!windowP.isRoundCorner).assertTrue();
                expect(!windowP.isTransparent).assertTrue();
                done();
            } catch (err) {
                console.error(msgStr + ' windowproperties error ' + JSON.stringify(err));
                expect.assertFail();
                done();
            }
        })

        /**
     * @tc.number		SUB_WMS_SETFOCUSABLE_JSAPI_001
     * @tc.name			Test setFocusable_Test_001
     * @tc.desc			Setting window focus acquisition and defocus
     */
        it('setFocusable_Test_001', 0, async function (done) {
            let msgStr = 'setFocusable_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getProperties().then(data => {
                    expect(data.focusable).assertTrue();
                    wnd.setFocusable(false).then(() => {
                        console.log(msgStr + ' setFocusable(false) success ');
                        wnd.getProperties().then(data => {
                            expect(!data.focusable).assertTrue();
                            wnd.setFocusable(true).then(() => {
                                console.log(msgStr + ' setFocusable(true) success ');
                                expect(TRUE_WINDOW).assertTrue();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' setFocusable failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETFOCUSABLE_JSAPI_002
     * @tc.name			Test setFocusable_Test_002
     * @tc.desc			The setting window loses focus and cannot be touched
     */
        it('setFocusable_Test_002', 0, async function (done) {
            let msgStr = 'setFocusable_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFocusable(false).then(() => {
                    console.log(msgStr + ' setFocusable(false) success ');
                    wnd.getProperties().then(data => {
                        expect(!data.focusable).assertTrue();
                        wnd.setTouchable(false).then(() => {
                            console.log(msgStr + ' setTouchable(false) success ');
                            wnd.getProperties().then(data => {
                                expect(!data.touchable).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' setTouchable failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setFocusable failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETFOCUSABLE_JSAPI_003
     * @tc.name			Test setFocusable_Test_003
     * @tc.desc			Set the window to lose focus and be touchable
     */
        it('setFocusable_Test_003', 0, async function (done) {
            let msgStr = 'setFocusable_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFocusable(false).then(() => {
                    console.log(msgStr + ' setFocusable(false) success ');
                    wnd.getProperties().then(data => {
                        expect(!data.focusable).assertTrue();
                        wnd.setTouchable(true).then(() => {
                            console.log(msgStr + ' setTouchable(true) success ');
                            wnd.getProperties().then(data => {
                                expect(data.touchable).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' setTouchable failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setFocusable failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETFOCUSABLE_JSAPI_004
     * @tc.name			Test setFocusable_Test_004
     * @tc.desc			Setting the window to get focus is not touchable
     */
        it('setFocusable_Test_004', 0, async function (done) {
            let msgStr = 'setFocusable_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFocusable(true).then(() => {
                    console.log(msgStr + ' setFocusable(true) success ');
                    wnd.getProperties().then(data => {
                        expect(data.focusable).assertTrue();
                        wnd.setTouchable(false).then(() => {
                            console.log(msgStr + ' setTouchable(false) success ');
                            wnd.getProperties().then(data => {
                                expect(!data.touchable).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' setTouchable failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setFocusable failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETFOCUSABLE_JSAPI_005
     * @tc.name			Test setFocusable_Test_005
     * @tc.desc			Set the window to get focus and touch
     */
        it('setFocusable_Test_005', 0, async function (done) {
            let msgStr = 'setFocusable_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFocusable(true).then(() => {
                    console.log(msgStr + ' setFocusable(true) success ');
                    wnd.getProperties().then(data => {
                        expect(data.focusable).assertTrue();
                        wnd.setTouchable(true).then(() => {
                            console.log(msgStr + ' setTouchable(true) success ');
                            wnd.getProperties().then(data => {
                                expect(data.touchable).assertTrue();
                                done();
                            }, (err) => {
                                console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' setTouchable failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setFocusable failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETTOUCHABLE_JSAPI_001
     * @tc.name			Test setTouchable_Test_001
     * @tc.desc			Set whether the window can be touched or not
     */
        it('setTouchable_Test_001', 0, async function (done) {
            let msgStr = 'setTouchable_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getProperties().then(data => {
                    expect(data.touchable).assertTrue();
                    wnd.setTouchable(false).then(() => {
                        console.log(msgStr + ' setTouchable(false) success ');
                        wnd.getProperties().then(data => {
                            expect(!data.touchable).assertTrue();
                            wnd.setTouchable(true).then(() => {
                                console.log(msgStr + ' setTouchable(true) success ');
                                wnd.getProperties().then(data => {
                                    expect(data.touchable).assertTrue();
                                    done();
                                }, (err) => {
                                    console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                })
                            }, (err) => {
                                console.log(msgStr + ' setTouchable failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' setTouchable failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETKEEPSCREENON_JSAPI_001
     * @tc.name			Test setKeepScreenOn_Test_001
     * @tc.desc			Set whether the window can be touched or not
     */
        it('setKeepScreenOn_Test_001', 0, async function (done) {
            let msgStr = 'setKeepScreenOn_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getProperties().then(data => {
                    expect(!data.isKeepScreenOn).assertTrue();
                    wnd.setKeepScreenOn(true).then(() => {
                        console.log(msgStr + ' setKeepScreenOn(true) success ');
                        wnd.getProperties().then(data => {
                            expect(data.isKeepScreenOn).assertTrue();
                            wnd.setKeepScreenOn(false).then(() => {
                                console.log(msgStr + ' setKeepScreenOn(false) success ');
                                wnd.getProperties().then(data => {
                                    expect(!data.isKeepScreenOn).assertTrue();
                                    done();
                                }, (err) => {
                                    console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                })
                            }, (err) => {
                                console.log(msgStr + ' setKeepScreenOn failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' setKeepScreenOn failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETKEEPSCREENON_JSAPI_002
     * @tc.name			Test setKeepScreenOn_Test_002
     * @tc.desc			Set whether the window can be touched or not
     */
        it('setKeepScreenOn_Test_002', 0, async function (done) {
            let msgStr = 'setKeepScreenOn_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                for (let i = 0; i < 5; i++) {
                    wnd.getProperties().then(data => {
                        expect(!data.isKeepScreenOn).assertTrue();
                        wnd.setKeepScreenOn(true).then(() => {
                            console.log(msgStr + ' setKeepScreenOn(true) success ');
                            wnd.getProperties().then(data => {
                                expect(data.touchable).assertTrue();
                                wnd.setKeepScreenOn(false).then(() => {
                                    console.log(msgStr + ' setKeepScreenOn(false) success ');
                                    wnd.getProperties().then(data => {
                                        expect(!data.touchable).assertTrue();
                                    }, (err) => {
                                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    })
                                }, (err) => {
                                    console.log(msgStr + ' setKeepScreenOn failed: err' + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                })
                            }, (err) => {
                                console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }, (err) => {
                            console.log(msgStr + ' setKeepScreenOn failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }
                done();
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLOR_JSAPI_001
     * @tc.name			Test setBackgroundColor_Test_001
     * @tc.desc			Set the window background color to red and Default opacity
     */
        it('setBackgroundColor_Test_001', 0, async function (done) {
            let msgStr = 'setBackgroundColor_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#ffff00").then(() => {
                    console.log(msgStr + ' setBrightness(#ffff00) success ');
                    wnd.getProperties().then(data => {
                        expect(!data.isTransparent).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setBackgroundColor failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLOR_JSAPI_002
     * @tc.name			Test setBackgroundColor_Test_002
     * @tc.desc			Set the window background color to red opaque
     */
        it('setBackgroundColor_Test_002', 0, async function (done) {
            let msgStr = 'setBackgroundColor_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#ffffff00").then(() => {
                    console.log(msgStr + ' setBrightness(#ffffff00) success ');
                    wnd.getProperties().then(data => {
                        expect(!data.isTransparent).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setBackgroundColor failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLOR_JSAPI_003
     * @tc.name			Test setBackgroundColor_Test_003
     * @tc.desc			Set the window background color to red transparent
     */
        it('setBackgroundColor_Test_003', 0, async function (done) {
            let msgStr = 'setBackgroundColor_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#00ffff00").then(() => {
                    console.log(msgStr + ' setBrightness(#00ffff00) success ');
                    wnd.getProperties().then(data => {
                        expect(data.isTransparent).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setBackgroundColor failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLOR_JSAPI_004
     * @tc.name			Test setBackgroundColor_Test_004
     * @tc.desc			Set the background color input parameter as an outlier
     */
        it('setBackgroundColor_Test_004', 0, async function (done) {
            let msgStr = 'setBackgroundColor_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("ff00").then(() => {
                    console.log(msgStr + ' setBrightness(#ff00) success ');
                    expect().assertFail();
                    done();
                }, (err) => {
                    console.log(msgStr + ' setBackgroundColor failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLOR_JSAPI_005
     * @tc.name			Test setBackgroundColor_Test_005
     * @tc.desc			Setting window background color input exception ARGB
     */
        it('setBackgroundColor_Test_005', 0, async function (done) {
            let msgStr = 'setBackgroundColor_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#hhgghhgg").then(() => {
                    console.log(msgStr + ' setBrightness(#hhgghhgg) success ');
                    expect().assertFail();
                    done();
                }, (err) => {
                    console.log(msgStr + ' setBackgroundColor failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLOR_JSAPI_006
     * @tc.name			Test setBackgroundColor_Test_006
     * @tc.desc			Setting window background color input exception RGB
     */
        it('setBackgroundColor_Test_006', 0, async function (done) {
            let msgStr = 'setBackgroundColor_Test_006';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#gghhkk").then(() => {
                    console.log(msgStr + ' setBrightness(#gghhkk) success ');
                    expect().assertFail();
                    done();
                }, (err) => {
                    console.log(msgStr + ' setBackgroundColor failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESS_JSAPI_001
     * @tc.name			Test setBrightness_Test_001
     * @tc.desc			Setting the brightness bar input parameter is normal
     */
        it('setBrightness_Test_001', 0, async function (done) {
            let msgStr = 'setBrightness_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(0).then(() => {
                    console.log(msgStr + ' setBrightness(0) success ');
                    wnd.getProperties().then(data => {
                        console.log(msgStr + ' getProperties data ' + data);
                        expect(data.brightness).assertEqual(0);
                        wnd.setBrightness(0.5).then(() => {
                            console.log(msgStr + ' setBrightness(0.5) success ');
                            wnd.getProperties().then(data => {
                                console.log(msgStr + ' getProperties data ' + data);
                                expect(data.brightness).assertEqual(0.5);
                                wnd.setBrightness(1).then(() => {
                                    console.log(msgStr + ' setBrightness(1) success ');
                                    wnd.getProperties().then(data => {
                                        console.log(msgStr + ' getProperties data ' + data);
                                        expect(data.brightness).assertEqual(1);
                                        done();
                                    }, (err) => {
                                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    })
                                }, (err) => {
                                    console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                })
                            }, (err) => {
                                console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })

                        }, (err) => {
                            console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESS_JSAPI_002
     * @tc.name			Test setBrightness_Test_002
     * @tc.desc			Set the brightness bar input parameter to decimal
     */
        it('setBrightness_Test_002', 0, async function (done) {
            let msgStr = 'setBrightness_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(0.564789).then(() => {
                    console.log(msgStr + ' setBrightness(0.564789) success ');
                    wnd.getProperties().then(data => {
                        console.log(msgStr + ' getProperties data ' + data);
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }, (err) => {
                    console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESS_JSAPI_003
     * @tc.name			Test setBrightness_Test_003
     * @tc.desc			Set the brightness bar input parameter to number max
     */
        it('setBrightness_Test_003', 0, async function (done) {
            let msgStr = 'setBrightness_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(Number.MAX_VALUE).then(() => {
                    console.log(msgStr + ' setBrightness(Number.MAX_VALUE) success ');
                    expect().assertFail();
                    done();
                }, (err) => {
                    console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESS_JSAPI_004
     * @tc.name			Test setBrightness_Test_004
     * @tc.desc			Set the brightness bar input parameter to number min
     */
        it('setBrightness_Test_004', 0, async function (done) {
            let msgStr = 'setBrightness_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(Number.MIN_VALUE).then(() => {
                    console.log(msgStr + ' setBrightness(Number.MIN_VALUE) success ');
                    expect(TRUE_WINDOW).assertTrue();
                    done();
                }, (err) => {
                    console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESS_JSAPI_005
     * @tc.name			Test setBrightness_Test_005
     * @tc.desc			Setting brightness bar input parameter exception
     */
        it('setBrightness_Test_005', 0, async function (done) {
            let msgStr = 'setBrightness_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(1.1).then(() => {
                    console.log(msgStr + ' setBrightness(1.1) success ');
                    expect().assertFail();
                    done();
                }, (err) => {
                    console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(1003);
                    wnd.setBrightness(-0.1).then(() => {
                        console.log(msgStr + ' setBrightness(-0.1) success ');
                        expect().assertFail();
                        done();
                    }, (err) => {
                        console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    })
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_setDimBehind_JSAPI_001
     * @tc.name			Test setDimBehindDeviceNotSupport_Test_001
     * @tc.desc			Set the setDimBehind interface invalid
     */
        it('setDimBehindDeviceNotSupport_Test_001', 0, async function (done) {
            let msgStr = 'setDimBehindDeviceNotSupport_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setDimBehind(0.5).then(() => {
                    console.info(msgStr + ' not support success ');
                    expect().assertFail();
                    done();
                }, err => {
                    console.info(msgStr + ' failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_setDimBehind_JSAPI_002
     * @tc.name			Test setDimBehindDeviceNotSupport_Test_002
     * @tc.desc			Set the setDimBehind interface invalid
     */
        it('setDimBehindDeviceNotSupport_Test_002', 0, async function (done) {
            let msgStr = 'setDimBehindDeviceNotSupport_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setDimBehind(0.5, (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the dimness2. Cause: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(801);
                        done();
                    } else {
                        console.info(msgStr + ' not support success ');
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.log('windowTest setDimBehind2 getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_setOutsideTouchable_JSAPI_001
     * @tc.name			Test setOutsideTouchableDeviceNotSupport_Test_001
     * @tc.desc			Set the setOutsideTouchable interface invalid
     */
        it('setOutsideTouchable_Test_001', 0, async function (done) {
            let msgStr = 'setOutsideTouchable_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setOutsideTouchable(true).then(() => {
                    console.info(msgStr + ' not support success ');
                    expect().assertFail();
                    done();
                }, err => {
                    console.info(msgStr + ' failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_setOutsideTouchable__JSAPI_002
     * @tc.name			Test setOutsideTouchableDeviceNotSupport_Test_002
     * @tc.desc			Set the setOutsideTouchable interface invalid
     */
        it('setOutsideTouchable_Test_002', 0, async function (done) {
            let msgStr = 'setOutsideTouchable_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setOutsideTouchable(false).then(() => {
                    console.info(msgStr + ' not support success ');
                    expect().assertFail();
                    done();
                }, err => {
                    console.info(msgStr + ' failed: err' + JSON.stringify(err));
                    expect(err.code).assertEqual(801);
                    done();
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_setOutsideTouchable_JSAPI_003
     * @tc.name			Test setOutsideTouchable_Test_003
     * @tc.desc			Set the setOutsideTouchable interface invalid
     */
        it('setOutsideTouchable_Test_003', 0, async function (done) {
            let msgStr = 'setOutsideTouchable_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setOutsideTouchable(true, (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the area to be touchable1. err: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(801);
                        done();
                    } else {
                        console.info(msgStr + ' not support success ');
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
    * @tc.number		SUB_WMS_setOutsideTouchable_JSAPI_004
    * @tc.name			Test setOutsideTouchable_Test_004
    * @tc.desc			Set the setOutsideTouchable interface invalid
    */
        it('setOutsideTouchable_Test_004', 0, async function (done) {
            let msgStr = 'setOutsideTouchable_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setOutsideTouchable(false, (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the area to be touchable4. err: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(801);
                        done();
                    } else {
                        console.info(msgStr + ' not support success ');
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_ENUM_ORIENTATION_JSAPI_001
     * @tc.name			Test enumOrientation_Test_001.
     * @tc.desc			To test the enum value of Orientation.
     */
        it('enumOrientation_Test_001', 0, async function (done) {
            let msgStr = 'setOutsideTouchable_Test_004';
            console.log(msgStr + ' begin');
            try {
                expect(0).assertEqual(window.Orientation.UNSPECIFIED);
                expect(1).assertEqual(window.Orientation.PORTRAIT);
                expect(2).assertEqual(window.Orientation.LANDSCAPE);
                expect(3).assertEqual(window.Orientation.PORTRAIT_INVERTED);
                expect(4).assertEqual(window.Orientation.LANDSCAPE_INVERTED);
                expect(5).assertEqual(window.Orientation.AUTO_ROTATION);
                expect(6).assertEqual(window.Orientation.AUTO_ROTATION_PORTRAIT);
                expect(7).assertEqual(window.Orientation.AUTO_ROTATION_LANDSCAPE);
                expect(8).assertEqual(window.Orientation.AUTO_ROTATION_RESTRICTED);
                expect(9).assertEqual(window.Orientation.AUTO_ROTATION_PORTRAIT_RESTRICTED);
                expect(10).assertEqual(window.Orientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED);
                expect(11).assertEqual(window.Orientation.LOCKED);
                done();
            } catch (err) {
                console.info(msgStr + 'test enum value of windowStageEventType error ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })

        /**
     * @tc.number		SUB_WMS_SETKEEPSCREENONCALLBACK_JSAPI_001
     * @tc.name			Test setKeepScreenOnCallBack_Test_001
    * @tc.desc			Set whether setKeepScreenOn or not
    */
        it('setKeepScreenOnCallBack_Test_001', 0, async function (done) {
            let msgStr = 'setKeepScreenOnCallBack_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getProperties().then(data => {
                    expect(!data.isKeepScreenOn).assertTrue();
                    wnd.setKeepScreenOn(true, (err, data) => {
                        if (err.code) {
                            console.error(msgStr + 'Failed to set the screen to be always on. err: ' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        } else {
                            console.info(msgStr + 'success set the screen to be always on. data: ' + JSON.stringify(data));
                            wnd.getProperties().then(data => {
                                expect(data.isKeepScreenOn).assertTrue();
                                done();
                            }, (err) => {
                                console.info(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            })
                        }
                    })
                }, (err) => {
                    console.info(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                    expect().assertFail();
                    done();
                })
            }, (err) => {
                console.info(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETKEEPSCREENON_JSAPI_002
     * @tc.name			Test setKeepScreenOnCallBack_Test_002
     * @tc.desc			Set whether the window can be touched or not
     */
        it('setKeepScreenOnCallBack_Test_002', 0, async function (done) {
            let msgStr = 'setKeepScreenOnCallBack_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                for (let i = 0; i < 5; i++) {
                    wnd.getProperties().then(data => {
                        expect(!data.isKeepScreenOn).assertTrue();
                        wnd.setKeepScreenOn(false, (err, data) => {
                            if (err.code) {
                                console.error(msgStr + 'Failed to set the screen to be always on. err: ' + JSON.stringify(err));
                                expect().assertFail();
                                done();
                            } else {
                                console.info(msgStr + 'success set the screen to be always on. data: ' + JSON.stringify(data));
                                wnd.getProperties().then(data => {
                                    expect(!data.isKeepScreenOn).assertTrue();
                                    done();
                                }, (err) => {
                                    console.info(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                })
                            }
                        })
                    }, (err) => {
                        console.info(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    })
                }
                done();
            }, (err) => {
                console.info(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLORCALLBACK_JSAPI_001
     * @tc.name			Test setBackgroundColorCALLBack_Test_001
     * @tc.desc			Set the window background color to red and Default opacity
     */
        it('setBackgroundColorCallBack_Test_001', 0, async function (done) {
            let msgStr = 'setBackgroundColorCallBack_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#ffff00", (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the background color. err: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        console.info(msgStr + 'Succeeded in setting the background color. Data: ' + JSON.stringify(data));
                        wnd.getProperties().then(data => {
                            expect(!data.isTransparent).assertTrue();
                            done();
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }
                })
            }, (err) => {
                console.info(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLORCALLBACK_JSAPI_002
     * @tc.name			Test setBackgroundColorCallBack_Test_002
    * @tc.desc			Set the window background color to red opaque
    */
        it('setBackgroundColorCallBack_Test_002', 0, async function (done) {
            let msgStr = 'setBackgroundColorCallBack_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#ffffff00", (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the background color2. err: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        console.info(msgStr + 'Succeeded in setting the background color2. Data: ' + JSON.stringify(data));
                        wnd.getProperties().then(data => {
                            expect(!data.isTransparent).assertTrue();
                            done();
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLORCallBack_JSAPI_003
     * @tc.name			Test setBackgroundColorBack_Test_003
     * @tc.desc			Set the window background color to red transparent
     */
        it('setBackgroundColorCallBack_Test_003', 0, async function (done) {
            let msgStr = 'setBackgroundColorCallBack_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#00ffff00", (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the background color2. err: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        console.info(msgStr + 'Succeeded in setting the background color2. Data: ' + JSON.stringify(data));
                        wnd.getProperties().then(data => {
                            expect(data.isTransparent).assertTrue();
                            done();
                        }, (err) => {
                            console.info(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLORCallBACK_JSAPI_004
     * @tc.name			Test setBackgroundColorCallBack_Test_004
     * @tc.desc			Set the background color input parameter as an outlier
     */
        it('setBackgroundColorCallBack_Test_004', 0, async function (done) {
            let msgStr = 'setBackgroundColorCallBack_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("ff00", (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the background color2. err: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        console.info(msgStr + 'Succeeded in setting the background color2. Data: ' + JSON.stringify(data));
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.info(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLORCallBack_JSAPI_005
     * @tc.name			Test setBackgroundColorCallBack_Test_005
     * @tc.desc			Setting window background color input exception ARGB
     */
        it('setBackgroundColorCallBack_Test_005', 0, async function (done) {
            let msgStr = 'setBackgroundColorCallBack_Test_005';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#hhgghhgg", (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the background color5. err: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        console.info(msgStr + 'Succeeded in setting the background color5. Data: ' + JSON.stringify(data));
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.info(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBACKGROUNDCOLORCallBack_JSAPI_006
     * @tc.name			Test setBackgroundColorBack_Test_006
     * @tc.desc			Setting window background color input exception RGB
     */
        it('setBackgroundColorCallBack_Test_006', 0, async function (done) {
            let msgStr = 'setBackgroundColorCallBack_Test_006';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBackgroundColor("#gghhkk", (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the background color6. err: ' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        console.info(msgStr + 'Succeeded in setting the background color6. Data: ' + JSON.stringify(data));
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESSCALLBACK_JSAPI_002
     * @tc.name			Test setBrightnessCallBack_Test_002
     * @tc.desc			Set the brightness bar input parameter to decimal
     */
        it('setBrightnessCallBack_Test_002', 0, async function (done) {
            let msgStr = 'setBrightnessCallBack_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(1, (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the brightness2. err: ' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        console.info(msgStr + 'Succeeded in setting the brightness2. Data: ' + JSON.stringify(data));
                        wnd.getProperties().then(data => {
                            console.info(msgStr + ' getProperties data ' + data);
                            expect(data.brightness).assertEqual(1);
                            done();
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }

                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESSCALLBACK_JSAPI_003
     * @tc.name			Test setBrightnessCallBack_Test_003
     * @tc.desc			Set the brightness bar input parameter to number max
     */
        it('setBrightnessCallBack_Test_003', 0, async function (done) {
            let msgStr = 'setBrightnessCallBack_Test_003';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(Number.MAX_VALUE, (err, data) => {
                    if (err.code) {
                        console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        console.log(msgStr + ' setBrightness(Number.MAX_VALUE) success ');
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESSCALLBACK_JSAPI_004
     * @tc.name			Test setBrightnessCallBack_Test_004
     * @tc.desc			Set the brightness bar input parameter to number min
     */
        it('setBrightnessCallBack_Test_004', 0, async function (done) {
            let msgStr = 'setBrightnessCallBack_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(Number.MIN_VALUE, (err, data) => {
                    if (err.code) {
                        console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        console.log(msgStr + ' setBrightness(Number.MIN_VALUE) success ');
                        expect(TRUE_WINDOW).assertTrue();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETBRIGHTNESSCALLBACK_JSAPI_005
     * @tc.name			Test setBrightnessCALLBACK_Test_005
     * @tc.desc			Setting brightness bar input parameter exception
     */
        it('setBrightnessCallBack_Test_005', 0, async function (done) {
            let msgStr = 'setBrightnessCallBack_Test_004';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setBrightness(1.1, (err, data) => {
                    if (err.code) {
                        console.log(msgStr + ' setBrightness failed: err' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        console.log(msgStr + ' setBrightness(1.1) success ');
                        expect().assertFail();
                        done();
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETTOUCHABLECALLBACK_JSAPI_001
     * @tc.name			Test setTouchableCallBack_Test_001
     * @tc.desc			Set whether the window can be touched or not
    */
        it('setTouchableCallBack_Test_001', 0, async function (done) {
            let msgStr = 'setTouchableCallBack_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setTouchable(false, (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the window to be touchable. err:' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getProperties().then(data => {
                            expect(!data.touchable).assertTrue();
                            wnd.setTouchable(true, (err, data) => {
                                if (err.code) {
                                    console.error(msgStr + 'Failed to set the window to be touchable. err:' + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                } else {
                                    wnd.getProperties().then(data => {
                                        expect(data.touchable).assertTrue();
                                        done();
                                    }, (err) => {
                                        console.info(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    })
                                }
                            })
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })
        })

        /**
     * @tc.number		SUB_WMS_SETFOCUSABLECALLBACK_JSAPI_001
     * @tc.name			Test setFocusable_Test_001
     * @tc.desc			Setting window focus acquisition and defocus
     */
        it('setFocusableCallBack_Test_001', 0, async function (done) {
            let msgStr = 'setFocusableCallBack_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.log(msgStr + ' getTopWindow wnd' + wnd);
                expect(wnd != null).assertTrue();
                wnd.setFocusable(false, (err, data) => {
                    if (err.code) {
                        console.error(msgStr + 'Failed to set the window to be setFocusable. err:' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        wnd.getProperties().then(data => {
                            expect(!data.focusable).assertTrue();
                            wnd.setFocusable(true, (err, data) => {
                                if (err.code) {
                                    console.error(msgStr + 'Failed to set the window to be setFocusable. err:' + JSON.stringify(err));
                                    expect().assertFail();
                                    done();
                                } else {
                                    wnd.getProperties().then(data => {
                                        expect(data.focusable).assertTrue();
                                        done();
                                    }, (err) => {
                                        console.info(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                                        expect().assertFail();
                                        done();
                                    })
                                }
                            })
                        }, (err) => {
                            console.log(msgStr + ' getProperties failed: err' + JSON.stringify(err));
                            expect().assertFail();
                            done();
                        })
                    }
                })
            }, (err) => {
                console.log(msgStr + ' getTopWindow failed: err' + JSON.stringify(err));
                expect().assertFail();
                done();
            })

        })

        /**
     * @tc.number		SUB_WMS_ENUM_AVOIDAREATYPE_JSAPI_001
     * @tc.name			Test avoidareatype_Test_001.
     * @tc.desc			To test the enum value of avoidareatype.
    */
        it('enumAvoidAreaType_Test_001', 0, async function (done) {
            let msgStr = 'enumAvoidAreaType_Test_001';
            console.log(msgStr + ' begin');
            try {
                expect(0).assertEqual(window.AvoidAreaType.TYPE_SYSTEM);
                expect(1).assertEqual(window.AvoidAreaType.TYPE_CUTOUT);
                expect(2).assertEqual(window.AvoidAreaType.TYPE_SYSTEM_GESTURE);
                expect(3).assertEqual(window.AvoidAreaType.TYPE_KEYBOARD);
                done();
            } catch (err) {
                console.info(msgStr + 'test enum value of AvoidArea error :' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })

        /**
     * @tc.number    SUB_WMS_GETAVOIDAREAADD_JSAPI_001
     * @tc.name      Test getAvoidAreaAdd_Test_001
     * @tc.desc      Get System type avoidance area
    */
        it('getAvoidAreaAdd_Test_001', 0, async function (done) {
            let msgStr = 'enumAvoidAreaType_Test_001';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(window.AvoidAreaType.TYPE_KEYBOARD, (err, data) => {
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.getAvoidArea callback fail err:' + JSON.stringify(err));
                        expect().assertFail();
                        done();
                    } else {
                        expect(data.visible).assertTrue();
                        expect(data.topRect != null).assertTrue();
                        expect(data.rightRect != null).assertTrue();
                        expect(data.bottomRect != null).assertTrue();
                        expect(data.leftRect != null).assertTrue();
                        done();
                    }
                })
            })
        })

        /**
     * @tc.number    SUB_WMS_GETAVOIDAREAADD_JSAPI_002
     * @tc.name      Test getAvoidAreaAdd_Test_002
     * @tc.desc      Get invalid parameter avoidarea
     */
        it('getAvoidAreaAdd_Test_002', 0, async function (done) {
            let msgStr = 'getAvoidAreaAdd_Test_002';
            console.log(msgStr + ' begin');
            window.getTopWindow().then(wnd => {
                console.info(msgStr + ' window.getTopWindow wnd: ' + wnd);
                expect(wnd != null).assertTrue();
                wnd.getAvoidArea(-1, (err, data) => {
                    console.info(msgStr + ' data:' + JSON.stringify(data));
                    if (err.code != 0) {
                        console.log(msgStr + ' wnd.getAvoidArea callback fail' + JSON.stringify(err));
                        expect(err.code).assertEqual(1003);
                        done();
                    } else {
                        expect().assertFail();
                        done();
                    }
                })
            })
        })

    })
}
