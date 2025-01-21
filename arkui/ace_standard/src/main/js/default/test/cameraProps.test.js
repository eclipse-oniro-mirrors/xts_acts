/**
 * Copyright (c) 2022 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import {describe, beforeAll,afterAll, it, expect} from 'deccjsunit/index';


describe('cameraPropsJsTest', function () {

    async function sleep(time) {
        return new Promise((resolve, reject) => {
            setTimeout(() => {
                resolve()
            }, time)
        }).then(() => {
            console.info(`sleep ${time} over...`)
        })
    }
    async function backToIndex() {
        let backToIndexPromise = new Promise((resolve, reject) => {
            setTimeout(() => {
                router.back({
                    uri: 'pages/index/index'
                });
                resolve()
            }, 500)
        })
        let clearPromise = new Promise((resolve, reject) => {
            setTimeout(() => {
                router.clear()
                resolve()
            }, 500)
        })
        await backToIndexPromise.then(() => {
            return clearPromise;
        })
    }

    /**
    * run before testcase
    */
    beforeAll(async function (done) {
        console.info('[cameraPropsJsTest] before each called')

        let result;
        let options = {
            uri: 'pages/camera/prop/index'
        }
        try {
            result = router.push(options)
            console.info("push cameraProps page success " + JSON.stringify(result));
        } catch (err) {
            console.error("push cameraProps page error " + JSON.stringify(result));
        }
        await sleep(4000)
        done()
    })

    /**
    * run after testcase
    */
    afterAll(async function () {
        console.info('[cameraPropsJsTest] after each called')
        await backToIndex()
        await sleep(1000)
    })

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraIdProp
     * @tc.desc      ACE
     */
    it('testCameraIdProp', 0, async function (done) {
        console.info('testCameraIdProp START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.idProp);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('idProp')
        done();
    });

    it('testCameraClassProp', 0, async function (done) {
        console.info('testCameraClassProp START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.classProp);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('classProp')
        expect(obj.$attrs.className).assertEqual('classProp')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraClassPropNone
     * @tc.desc      ACE
     */
    it('testCameraClassPropNone', 0, async function (done) {
        console.info('testCameraClassPropNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.classPropNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('classPropNone')
        expect(obj.$attrs.className).assertEqual(undefined)
        console.info("[cameraProps] get className value is: " + JSON.stringify(obj.$attrs.className));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraStyleProp
     * @tc.desc      ACEs
     */
    it('testCameraStyleProp', 0, async function (done) {
        console.info('testCameraStyleProp START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.styleProp);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('styleProp')
        expect(obj.$attrs.style).assertEqual(undefined)
        console.info("[divProps] get style value is: " + JSON.stringify(obj.$attrs.style));
        //        expect(obj.$styles.height).assertEqual(undefined);
        //        console.info("[divProps] get style height value is: " + JSON.stringify(obj.$styles.height));
        //        expect(obj.$styles.get('background-color')).assertEqual(undefined);
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraRefProp
     * @tc.desc      ACE
     */
    it('testCameraRefProp', 0, async function (done) {
        console.info('testCameraRefProp START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.refProp);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('refProp')
        expect(obj.$attrs.ref).assertEqual('refProp')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraRefPropNone
     * @tc.desc      ACE
     */
    it('testCameraRefPropNone', 0, async function (done) {
        console.info('testCameraRefPropNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.refPropNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('refPropNone')
        expect(obj.$attrs.ref).assertEqual(undefined)
        console.info("[cameraProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDisabledPropTrue
     * @tc.desc      ACE
     */
    it('testCameraDisabledPropTrue', 0, async function (done) {
        console.info('testCameraDisabledPropTrue START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.disabledPropTrue);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('disabledPropTrue')
        expect(obj.$attrs.disabled).assertEqual('true')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDisabledPropFalse
     * @tc.desc      ACE
     */
    it('testCameraDisabledPropFalse', 0, async function (done) {
        console.info('testCameraDisabledPropFalse START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.disabledPropFalse);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('disabledPropFalse')
        expect(obj.$attrs.disabled).assertEqual('false')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDisabledPropNone
     * @tc.desc      ACE
     */
    it('testCameraDisabledPropNone', 0, async function (done) {
        console.info('testCameraDisabledPropNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.disabledPropNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('disabledPropNone')
        expect(obj.$attrs.disabled).assertEqual('false')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFocusablePropTrue
     * @tc.desc      ACE
     */
    it('testCameraFocusablePropTrue', 0, async function (done) {
        console.info('testCameraFocusablePropTrue START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.focusablePropTrue);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('focusablePropTrue')
        expect(obj.$attrs.focusable).assertEqual('true')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFocusablePropFalse
     * @tc.desc      ACE
     */
    it('testCameraFocusablePropFalse', 0, async function (done) {
        console.info('testCameraFocusablePropFalse START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.focusablePropFalse);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('focusablePropFalse')
        expect(obj.$attrs.focusable).assertEqual('false')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFocusablePropNone
     * @tc.desc      ACE
     */
    it('testCameraFocusablePropNone', 0, async function (done) {
        console.info('testCameraFocusablePropNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.focusablePropNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('focusablePropNone')
        expect(obj.$attrs.focusable).assertEqual('false')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDataProp
     * @tc.desc      ACE
     */
    it('testCameraDataProp', 0, async function (done) {
        console.info('testCameraDataProp START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.dataProp);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('dataProp')
        expect(obj.$attrs.datacamera).assertEqual(undefined);
        console.info("[cameraProps] get datacamera value is: " + JSON.stringify(obj.$attrs.datacamera));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDataPropNone
     * @tc.desc      ACE
     */
    it('testCameraDataPropNone', 0, async function (done) {
        console.info('testCameraDataPropNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.dataPropNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('dataPropNone')
        expect(obj.$attrs.datacamera).assertEqual(undefined)
        console.info("[cameraProps] get datacamera value is: " + JSON.stringify(obj.$attrs.datacamera));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraClickEffectPropSmall
     * @tc.desc      ACE
     */
    it('testCameraClickEffectPropSmall', 0, async function (done) {
        console.info('testCameraClickEffectPropSmall START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
        expect(obj.$attrs.clickEffect).assertEqual('spring-small')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraClickEffectPropMedium
     * @tc.desc      ACE
     */
    it('testCameraClickEffectPropMedium', 0, async function (done) {
        console.info('testCameraClickEffectPropMedium START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
        expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraClickEffectPropLarge
     * @tc.desc      ACE
     */
    it('testCameraClickEffectPropLarge', 0, async function (done) {
        console.info('testCameraClickEffectPropLarge START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
        expect(obj.$attrs.clickEffect).assertEqual('spring-large')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraClickEffectPropNone
     * @tc.desc      ACE
     */
    it('testCameraClickEffectPropNone', 0, async function (done) {
        console.info('testCameraClickEffectPropNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.clickEffectPropNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
        expect(obj.$attrs.clickEffect).assertEqual(undefined)
        console.info("[cameraProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDirPropRtl
     * @tc.desc      ACE
     */
    it('testCameraDirPropRtl', 0, async function (done) {
        console.info('testCameraDirPropRtl START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.dirPropRtl);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('dirPropRtl')
        expect(obj.$attrs.dir).assertEqual('rtl')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDirPropLtr
     * @tc.desc      ACE
     */
    it('testCameraDirPropLtr', 0, async function (done) {
        console.info('testCameraDirPropLtr START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.dirPropLtr);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('dirPropLtr')
        expect(obj.$attrs.dir).assertEqual('ltr')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDirPropAuto
     * @tc.desc      ACE
     */
    it('testCameraDirPropAuto', 0, async function (done) {
        console.info('testCameraDirPropAuto START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.dirPropAuto);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('dirPropAuto')
        expect(obj.$attrs.dir).assertEqual('auto')
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDirPropNone
     * @tc.desc      ACE
     */
    it('testCameraDirPropNone', 0, async function (done) {
        console.info('testCameraDirPropNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.dirPropNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('dirPropNone')
        expect(obj.$attrs.dir).assertEqual('auto')
        done();
    });

    // 特有属性
    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFlashOn
     * @tc.desc      ACE
     */
    it('testCameraFlashOn', 0, async function (done) {
        console.info('testCameraFlashOn START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.flashOn);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('flashOn')
        expect(obj.$attrs.flash).assertEqual('on')
        console.info("[cameraProps] get flashOn value is: " + JSON.stringify(obj.$attrs.flash));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFlashOff
     * @tc.desc      ACE
     */
    it('testCameraFlashOff', 0, async function (done) {
        console.info('testCameraFlashOff START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.flashOff);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('flashOff')
        expect(obj.$attrs.flash).assertEqual('off')
        console.info("[cameraProps] get flashOff value is: " + JSON.stringify(obj.$attrs.flash));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFlashTorch
     * @tc.desc      ACE
     */
    it('testCameraFlashTorch', 0, async function (done) {
        console.info('testCameraFlashTorch START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.flashTorch);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('flashTorch')
        expect(obj.$attrs.flash).assertEqual('torch')
        console.info("[cameraProps] get flashTorch value is: " + JSON.stringify(obj.$attrs.flash));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFlashNone
     * @tc.desc      ACE
     */
    it('testCameraFlashNone', 0, async function (done) {
        console.info('testCameraFlashOn START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.flashNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('flashNone')
        expect(obj.$attrs.flash).assertEqual('off')
        console.info("[cameraProps] get flashNone value is: " + JSON.stringify(obj.$attrs.flash));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraFlashOn
     * @tc.desc      ACE
     */
    it('testCameraDevicePositionFront', 0, async function (done) {
        console.info('testCameraDevicePositionFront START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.devicePositionFront);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('devicePositionFront')
        expect(obj.$attrs.flash).assertEqual('front')
        console.info("[cameraProps] get devicePositionFront value is: " + JSON.stringify(obj.$attrs.flash));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDevicePositionBack
     * @tc.desc      ACE
     */
    it('testCameraDevicePositionBack', 0, async function (done) {
        console.info('testCameraDevicePositionFront START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.devicePositionBack);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('devicePositionBack')
        expect(obj.$attrs.flash).assertEqual('back')
        console.info("[cameraProps] get devicePositionBack value is: " + JSON.stringify(obj.$attrs.flash));
        done();
    });

    /**
     * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
     * @tc.name      testCameraDevicePositionNone
     * @tc.desc      ACE
     */
    it('testCameraDevicePositionNone', 0, async function (done) {
        console.info('testCameraDevicePositionNone START');
        console.info("[cameraProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

        let obj = JSON.parse(globalThis.value.devicePositionNone);
        console.info("[cameraProps] get inspector value is: " + JSON.stringify(obj));
        console.info("[cameraProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

        expect(obj.$type).assertEqual('camera')
        expect(obj.$attrs.id).assertEqual('devicePositionNone')
        expect(obj.$attrs.flash).assertEqual('back')
        console.info("[cameraProps] get devicePositionNone value is: " + JSON.stringify(obj.$attrs.flash));
        done();
    });

});
