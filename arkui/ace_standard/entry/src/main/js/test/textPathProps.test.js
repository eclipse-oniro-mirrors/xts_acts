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
    describe('toolbarPropsJsTestAdapt001', function() {

        var name = 'textPath',
            nameA = 'TextPath',
            labelName = 'textPath';

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
         * @tc.name   testTextPathIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTextPathIdProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt001TextPathPathProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt001TextPathPathProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'PathProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pathProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('pathProp')
            expect(obj.$attrs.path).assertEqual('M0,20 Q50,20 100,20')
            console.info("[" + name + "Props] get path value is: " + JSON.stringify(obj.$attrs.path));
            done();
        });

        /**
         * @tc.name   testAdapt002TextPathPathPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt002TextPathPathPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'PathPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pathPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('pathPropNone')
            expect(obj.$attrs.path).assertEqual(undefined)
            console.info("[" + name + "Props] get path value is: " + JSON.stringify(obj.$attrs.path));
            done();
        });

        /**
         * @tc.name   testAdapt003TextPathStartOffsetPropLength
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt003TextPathStartOffsetPropLength', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StartOffsetPropLength START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.startOffsetPropLength);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('startOffsetPropLength')
            expect(obj.$attrs.startoffset).assertEqual('30px')
            console.info("[" + name + "Props] get x startOffset is: " + JSON.stringify(obj.$attrs.startoffset));
            done();
        });

        /**
         * @tc.name   testAdapt004TextPathStartOffsetPropPercentage
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt004TextPathStartOffsetPropPercentage', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StartOffsetPropPercentage START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.startOffsetPropPercentage);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('startOffsetPropPercentage')
            expect(obj.$attrs.x).startoffset('60%')
            console.info("[" + name + "Props] get startOffset value is: " + JSON.stringify(obj.$attrs.startoffset));
            done();
        });

        /**
         * @tc.name   testAdapt005TextPathStartOffsetPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt005TextPathStartOffsetPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StartOffsetPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.startOffsetPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('startOffsetPropNone')
            expect(obj.$attrs.startoffset).assertEqual(undefined)
            console.info("[" + name + "Props] get startOffset value is: " + JSON.stringify(obj.$attrs.startoffset));
            done();
        });

        /**
         * @tc.name   testAdapt006TextPathByProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt006TextPathByProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ByProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.byProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('byProp')
            expect(obj.$attrs.by).assertEqual('1')
            console.info("[" + name + "Props] get by value is: " + JSON.stringify(obj.$attrs.by));
            done();
        });

        /**
         * @tc.name   testAdapt007TextPathByPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt007TextPathByPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ByPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.byPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('byPropNone')
            expect(obj.$attrs.by).assertEqual(undefined)
            console.info("[" + name + "Props] get by value is: " + JSON.stringify(obj.$attrs.by));
            done();
        });

        /**
         * @tc.name   testAdapt008TextPathFontSizeProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt008TextPathFontSizeProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FontSizeProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fontSizeProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fontSizeProp')
            expect(obj.$attrs.fontSize).assertEqual('20')
            console.info("[" + name + "Props] get fontSize value is: " + JSON.stringify(obj.$attrs.fontSize));
            done();
        });

        /**
         * @tc.name   testAdapt009TextPathFontSizePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt009TextPathFontSizePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FontSizePropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fontSizePropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fontSizePropNone')
            expect(obj.$attrs.fontSize).assertEqual(undefined)
            console.info("[" + name + "Props] get fontSize value is: " + JSON.stringify(obj.$attrs.fontSize));
            done();
        });

        /**
         * @tc.name   testAdapt010TextPathFillProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt010TextPathFillProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillProp')
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[" + name + "Props] get fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testAdapt011TextPathFillPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt011TextPathFillPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillPropNone')
            expect(obj.$attrs.fill).assertEqual(undefined)
            console.info("[" + name + "Props] get fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testAdapt012TextPathFillOpacityProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt012TextPathFillOpacityProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillOpacityProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillOpacityProp')
            expect(obj.$attrs.fillOpacity).assertEqual('0.5')
            console.info("[" + name + "Props] get fillOpacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testAdapt013TextPathFillOpacityPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt013TextPathFillOpacityPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillOpacityPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillOpacityPropNone')
            expect(obj.$attrs.fillOpacity).assertEqual(undefined)
            console.info("[" + name + "Props] get fillOpacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testAdapt014TextPathOpacityProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt014TextPathOpacityProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'OpacityProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('opacityProp')
            expect(obj.$attrs.opacity).assertEqual('0.5')
            console.info("[" + name + "Props] get opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testAdapt015TextPathOpacityPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt015TextPathOpacityPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'OpacityPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('opacityPropNone')
            expect(obj.$attrs.opacity).assertEqual(undefined)
            console.info("[" + name + "Props] get opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testAdapt016TextPathStrokeProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt016TextPathStrokeProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StrokeProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('strokeProp')
            expect(obj.$attrs.stroke).assertEqual('#ff00ff')
            console.info("[" + name + "Props] get stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testAdapt017TextPathStrokePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt017TextPathStrokePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StrokePropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokePropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('strokePropNone')
            expect(obj.$attrs.stroke).assertEqual(undefined)
            console.info("[" + name + "Props] get stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testAdapt018TextPathStrokeWidthProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt018TextPathStrokeWidthProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StrokeWidthProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeWidthProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('strokeWidthProp')
            expect(obj.$attrs.strokeWidth).assertEqual('2')
            console.info("[" + name + "Props] get strokeWidth value is: " + JSON.stringify(obj.$attrs.strokeWidth));
            done();
        });

        /**
         * @tc.name   testAdapt019TextPathStrokeWidthPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt019TextPathStrokeWidthPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StrokeWidthPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeWidthPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('strokeWidthPropNone')
            expect(obj.$attrs.strokeWidth).assertEqual(undefined)
            console.info("[" + name + "Props] get strokeWidth value is: " + JSON.stringify(obj.$attrs.strokeWidth));
            done();
        });

        /**
         * @tc.name   testAdapt020TextPathStrokeOpacityProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt020TextPathStrokeOpacityProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StrokeOpacityProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('strokeOpacityProp')
            expect(obj.$attrs.strokeOpacity).assertEqual('0.4')
            console.info("[" + name + "Props] get strokeOpacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testAdapt021TextPathStrokeOpacityPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt021TextPathStrokeOpacityPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'StrokeOpacityPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropNone')
            expect(obj.$attrs.strokeOpacity).assertEqual(undefined)
            console.info("[" + name + "Props] get strokeOpacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });
    });
}