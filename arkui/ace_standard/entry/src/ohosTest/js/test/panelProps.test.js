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
import { describe, beforeAll, afterAll, it, expect, Level } from '@ohos/hypium';


export default function panelPropsJsTest() {
    describe('panelPropsJsTest', function() {

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
                    resolve();
                }, 500);
            });
            let clearPromise = new Promise((resolve, reject) => {
                setTimeout(() => {
                    router.clear();
                    resolve();
                }, 500);
            });
            await backToIndexPromise.then(() => {
                return clearPromise;
            });
        }

        /**
         * run before testcase
         */
        beforeAll(async function(done) {
            console.info('[panelPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/panel/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push panelProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push panelProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[panelPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testPanelIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelIdProp', Level.LEVEL0, async function(done) {
            console.info('testPanelIdProp START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testPanelClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelClassProp', Level.LEVEL0, async function(done) {
            console.info('testPanelClassProp START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testPanelClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testPanelClassPropNone START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[panelProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });


        /**
         * @tc.name   testPanelPropsRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelPropsRefProp', Level.LEVEL0, async function(done) {
            console.info('testPanelPropsRefProp START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testPanelRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testPanelRefPropNone START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[panelProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testPanelDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelDataProp', Level.LEVEL0, async function(done) {
            console.info('testPanelDataProp START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataPanel).assertEqual(undefined);
            console.info("[panelProps] get dataPanel value is: " + JSON.stringify(obj.$attrs.dataPanel));
            done();
        });

        /**
         * @tc.name   testPanelDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testPanelDataPropNone START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataPanel).assertEqual(undefined)
            console.info("[panelProps] get dataPanel value is: " + JSON.stringify(obj.$attrs.dataPanel));
            done();
        });

        /**
         * @tc.name   testPanelClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('testPanelClickEffectPropSmall START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testPanelClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('testPanelClickEffectPropMedium START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testPanelClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('testPanelClickEffectPropLarge START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testPanelClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('testPanelClickEffectPropNone START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[panelProps] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testPanelDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('testPanelDirPropRtl START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testPanelDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('testPanelDirPropLtr START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testPanelDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('testPanelDirPropAuto START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testPanelDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPanelDirPropNone', Level.LEVEL0, async function(done) {
            console.info('testPanelDirPropNone START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual(undefined)
            done();
        });


        /**
         * @tc.name   testTypePropFoldAble
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTypePropFoldAble', Level.LEVEL0, async function(done) {
            console.info('testTypePropFoldAble START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropFoldAble); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('typePropFoldAble') //ID
            expect(obj.$attrs.type).assertEqual('foldable') //prop and value
            console.info("[panelProps] get type value is: " + JSON.stringify(obj.$attrs.type)); //prop
            done();
        });

        /**
         * @tc.name   testTypePropMinibar
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTypePropMinibar', Level.LEVEL0, async function(done) {
            console.info('testTypePropMinibar START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropMinibar); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('typePropMinibar') //ID
            expect(obj.$attrs.type).assertEqual('minibar') //prop and value
            console.info("[panelProps] get type value is: " + JSON.stringify(obj.$attrs.type)); //prop
            done();
        });

        /**
         * @tc.name   testTypePropTemporary
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTypePropTemporary', Level.LEVEL0, async function(done) {
            console.info('testTypePropTemporary START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropTemporary); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('typePropTemporary') //ID
            expect(obj.$attrs.type).assertEqual('temporary') //prop and value
            console.info("[panelProps] get type value is: " + JSON.stringify(obj.$attrs.type)); //prop
            done();
        });

        /**
         * @tc.name   testModePropMini
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testModePropMini', Level.LEVEL0, async function(done) {
            console.info('testModePropMini START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.modePropMini); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('modePropMini') //ID
            expect(obj.$attrs.mode).assertEqual('mini') //prop and value
            console.info("[panelProps] get mode value is: " + JSON.stringify(obj.$attrs.mode)); //prop
            done();
        });

        /**
         * @tc.name   testModePropHalf
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testModePropHalf', Level.LEVEL0, async function(done) {
            console.info('testModePropHalf START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.modePropHalf); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('modePropHalf') //ID
            expect(obj.$attrs.mode).assertEqual('half') //prop and value
            console.info("[panelProps] get mode value is: " + JSON.stringify(obj.$attrs.mode)); //prop
            done();
        });

        /**
         * @tc.name   testModePropFull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testModePropFull', Level.LEVEL0, async function(done) {
            console.info('testModePropFull START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.modePropFull); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('modePropFull') //ID
            expect(obj.$attrs.mode).assertEqual('full') //prop and value
            console.info("[panelProps] get mode value is: " + JSON.stringify(obj.$attrs.mode)); //prop
            done();
        });

        /**
         * @tc.name   testDragBarPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDragBarPropTrue', Level.LEVEL0, async function(done) {
            console.info('testDragBarPropTrue START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dragBarPropTrue); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dragBarPropTrue') //ID
            expect(obj.$attrs.dragbar).assertEqual('true') //prop and value
            console.info("[panelProps] get dragbar value is: " + JSON.stringify(obj.$attrs.dragbar)); //prop
            done();
        });

        /**
         * @tc.name   testDragBarPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDragBarPropFalse', Level.LEVEL0, async function(done) {
            console.info('testDragBarPropFalse START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dragBarPropFalse); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('dragBarPropFalse') //ID
            expect(obj.$attrs.dragbar).assertEqual('false') //prop and value
            console.info("[panelProps] get dragbar value is: " + JSON.stringify(obj.$attrs.dragbar)); //prop
            done();
        });

        /**
         * @tc.name   testFullHeightPro
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testFullHeightPro', Level.LEVEL0, async function(done) {
            console.info('testFullHeightPro START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fullHeightPro); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('fullHeightPro') //ID
            expect(obj.$attrs.fullheight).assertEqual('500px') //prop and value
            console.info("[panelProps] get fullheight value is: " + JSON.stringify(obj.$attrs.fullheight)); //prop
            done();
        });

        /**
         * @tc.name   testHalfHeightPro
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testHalfHeightPro', Level.LEVEL0, async function(done) {
            console.info('testHalfHeightPro START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.halfHeightPro); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('halfHeightPro') //ID
            expect(obj.$attrs.halfheight).assertEqual('400px') //prop and value
            console.info("[panelProps] get halfheight value is: " + JSON.stringify(obj.$attrs.halfheight)); //prop
            done();
        });

        /**
         * @tc.name   testMiniHeightPro
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testMiniHeightPro', Level.LEVEL0, async function(done) {
            console.info('testMiniHeightPro START');
            console.info("[panelProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.miniHeightPro); //ID
            console.info("[panelProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[panelProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('panel')
            expect(obj.$attrs.id).assertEqual('miniHeightPro') //ID
            expect(obj.$attrs.miniheight).assertEqual('50px') //prop and value
            console.info("[panelProps] get miniheight value is: " + JSON.stringify(obj.$attrs.miniheight)); //prop
            done();
        });
    });
}