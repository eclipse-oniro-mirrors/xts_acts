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


export default function undo() {
    describe('toolbarPropsJsTest5Adapt001', function() {

        var name = 'toolbarItem',
            nameA = 'ToolbarItem',
            labelName = "toolbar-item";

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
            console.info('[' + name + 'PropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/' + name + '/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push " + name + "Props page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push " + name + "Props page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[' + name + 'PropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testToolbarItemIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testToolbarItemIdProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'IdProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.name   testAdapt001ToolbarItemClassProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt001ToolbarItemClassProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClassProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('classProp')
            expect(obj.$attrs.className).assertEqual('classProp')
            done();
        });

        /**
         * @tc.name   testAdapt002ToolbarItemClassPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt002ToolbarItemClassPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClassPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[" + name + "Props] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.name   testAdapt003ToolbarItemRefProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt003ToolbarItemRefProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RefProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.name   testAdapt004ToolbarItemRefPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt004ToolbarItemRefPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RefPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[" + name + "Props] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.name   testAdapt005ToolbarItemDisabledPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt005ToolbarItemDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DisabledPropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testAdapt006ToolbarItemDisabledPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt006ToolbarItemDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DisabledPropFalse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt007ToolbarItemDisabledPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt007ToolbarItemDisabledPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DisabledPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('disabledPropNone')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt008ToolbarItemFocusablePropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt008ToolbarItemFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FocusablePropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.name   testAdapt009ToolbarItemFocusablePropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt009ToolbarItemFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FocusablePropFalse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt010ToolbarItemFocusablePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt010ToolbarItemFocusablePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FocusablePropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('focusablePropNone')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.name   testAdapt011ToolbarItemDataProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt011ToolbarItemDataProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DataProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataDiv).assertEqual(undefined);
            console.info("[" + name + "Props] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.name   testAdapt012ToolbarItemDataPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt012ToolbarItemDataPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DataPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataDiv).assertEqual(undefined)
            console.info("[" + name + "Props] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.name   testAdapt013ToolbarItemClickEffectPropSmall
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt013ToolbarItemClickEffectPropSmall', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropSmall START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropSmall);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('clickEffectPropSmall')
            expect(obj.$attrs.clickEffect).assertEqual('spring-small')
            done();
        });

        /**
         * @tc.name   testAdapt014ToolbarItemClickEffectPropMedium
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt014ToolbarItemClickEffectPropMedium', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropMedium START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropMedium);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('clickEffectPropMedium')
            expect(obj.$attrs.clickEffect).assertEqual('spring-medium')
            done();
        });

        /**
         * @tc.name   testAdapt015ToolbarItemClickEffectPropLarge
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt015ToolbarItemClickEffectPropLarge', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropLarge START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropLarge);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('clickEffectPropLarge')
            expect(obj.$attrs.clickEffect).assertEqual('spring-large')
            done();
        });

        /**
         * @tc.name   testAdapt016ToolbarItemClickEffectPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt016ToolbarItemClickEffectPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ClickEffectPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.clickEffectPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('clickEffectPropNone')
            expect(obj.$attrs.clickEffect).assertEqual(undefined)
            console.info("[" + name + "Props] get clickEffect value is: " + JSON.stringify(obj.$attrs.clickEffect));
            done();
        });

        /**
         * @tc.name   testAdapt017ToolbarItemDirPropRtl
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt017ToolbarItemDirPropRtl', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropRtl START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropRtl);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('dirPropRtl')
            expect(obj.$attrs.dir).assertEqual('rtl')
            done();
        });

        /**
         * @tc.name   testAdapt018ToolbarItemDirPropLtr
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt018ToolbarItemDirPropLtr', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropLtr START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropLtr);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('dirPropLtr')
            expect(obj.$attrs.dir).assertEqual('ltr')
            done();
        });

        /**
         * @tc.name   testAdapt019ToolbarItemDirPropAuto
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt019ToolbarItemDirPropAuto', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropAuto START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropAuto);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('dirPropAuto')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testAdapt020ToolbarItemDirPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt020ToolbarItemDirPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DirPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dirPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('dirPropNone')
            expect(obj.$attrs.dir).assertEqual('auto')
            done();
        });

        /**
         * @tc.name   testAdapt021ToolbarItemForPropNull
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt021ToolbarItemForPropNull', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ForPropNull START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testAdapt022ToolbarItemForPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt022ToolbarItemForPropOne', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ForPropOne START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testAdapt023ToolbarItemForPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt023ToolbarItemForPropThree', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ForPropThree START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.name   testAdapt024ToolbarItemIfPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt024ToolbarItemIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'IfPropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[" + name + "Props] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.name   testAdapt025ToolbarItemShowPropTrue
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt025ToolbarItemShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropTrue START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[" + name + "Props] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testAdapt026ToolbarItemShowPropFalse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt026ToolbarItemShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropFalse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[" + name + "Props] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testAdapt027ToolbarItemShowPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt027ToolbarItemShowPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('showPropNone')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[" + name + "Props] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.name   testAdapt028ToolbarItemValuePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt028ToolbarItemValuePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.valueProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('valueProp')
            expect(obj.$attrs.value).assertEqual('text')
            console.info("[" + name + "Props] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testAdapt029ToolbarItemValuePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt029ToolbarItemValuePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.valuePropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('valuePropNone')
            expect(obj.$attrs.value).assertEqual(undefined)
            console.info("[" + name + "Props] get value value is: " + JSON.stringify(obj.$attrs.value));
            done();
        });

        /**
         * @tc.name   testAdapt030ToolbarItemValuePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt030ToolbarItemValuePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.iconProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('iconProp')
            expect(obj.$attrs.icon).assertEqual('common/images/icon.png')
            console.info("[" + name + "Props] get icon value is: " + JSON.stringify(obj.$attrs.icon));
            done();
        });

        /**
         * @tc.name   testAdapt031ToolbarItemIconPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt031ToolbarItemIconPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ShowPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.iconPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('iconPropNone')
            expect(obj.$attrs.icon).assertEqual(undefined)
            console.info("[" + name + "Props] get icon value is: " + JSON.stringify(obj.$attrs.icon));
            done();
        });
    });
}