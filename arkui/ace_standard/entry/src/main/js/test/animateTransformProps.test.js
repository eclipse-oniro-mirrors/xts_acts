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
    describe('toolbarPropsJsTest4Adapt001', function() {

        var name = 'animateTransform',
            nameA = 'AnimateTransform',
            labelName = 'animateTransform';

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
         * @tc.name   testAnimateTransformIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAnimateTransformIdProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt001AnimateTransformAttributeNameProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt001AnimateTransformAttributeNameProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'AttributeNameProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.attributeNameProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('attributeNameProp')
            expect(obj.$attrs.attributename).assertEqual('x')
            console.info("[" + name + "Props] get attributename value is: " + JSON.stringify(obj.$attrs.attributename));
            done();
        });

        /**
         * @tc.name   testAdapt002AnimateTransformAttributeNamePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt002AnimateTransformAttributeNamePropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'AttributeNamePropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.attributeNamePropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('attributeNamePropNone')
            expect(obj.$attrs.attributename).assertEqual(undefined)
            console.info("[" + name + "Props] get attributename value is: " + JSON.stringify(obj.$attrs.attributename));
            done();
        });

        /**
         * @tc.name   testAdapt003AnimateTransformBeginProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt003AnimateTransformBeginProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'BeginProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.beginProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('beginProp')
            expect(obj.$attrs.begin).assertEqual('1000')
            console.info("[" + name + "Props] get begin value is: " + JSON.stringify(obj.$attrs.begin));
            done();
        });

        /**
         * @tc.name   testAdapt004AnimateTransformBeginPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt004AnimateTransformBeginPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'BeginPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.beginPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('beginPropNone')
            expect(obj.$attrs.begin).assertEqual(undefined)
            console.info("[" + name + "Props] get begin value is: " + JSON.stringify(obj.$attrs.begin));
            done();
        });

        /**
         * @tc.name   testAdapt005AnimateTransformDurProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt005AnimateTransformDurProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DurProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.durProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('durProp')
            expect(obj.$attrs.dur).assertEqual('1000')
            console.info("[" + name + "Props] get dur value is: " + JSON.stringify(obj.$attrs.dur));
            done();
        });

        /**
         * @tc.name   testAdapt006AnimateTransformDurPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt006AnimateTransformDurPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'DurPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.durPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('durPropNone')
            expect(obj.$attrs.dur).assertEqual(undefined)
            console.info("[" + name + "Props] get dur value is: " + JSON.stringify(obj.$attrs.dur));
            done();
        });

        /**
         * @tc.name   testAdapt007AnimateTransformEndProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt007AnimateTransformEndProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'EndProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.endProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('endProp')
            expect(obj.$attrs.end).assertEqual('1000')
            console.info("[" + name + "Props] get end value is: " + JSON.stringify(obj.$attrs.end));
            done();
        });

        /**
         * @tc.name   testAdapt008AnimateTransformEndPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt008AnimateTransformEndPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'EndPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.endPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('endPropNone')
            expect(obj.$attrs.end).assertEqual(undefined)
            console.info("[" + name + "Props] get end value is: " + JSON.stringify(obj.$attrs.end));
            done();
        });

        /**
         * @tc.name   testAdapt009AnimateTransformRepeatCountProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt009AnimateTransformRepeatCountProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RepeatCountProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.repeatCountProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('repeatCountProp')
            expect(obj.$attrs.repeatcount).assertEqual('20')
            console.info("[" + name + "Props] get repeatcount value is: " + JSON.stringify(obj.$attrs.repeatcount));
            done();
        });

        /**
         * @tc.name   testAdapt010AnimateTransformRepeatCountPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt010AnimateTransformRepeatCountPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RepeatCountPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.repeatCountPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('repeatCountPropNone')
            expect(obj.$attrs.repeatcount).assertEqual(undefined)
            console.info("[" + name + "Props] get repeatcount value is: " + JSON.stringify(obj.$attrs.repeatcount));
            done();
        });

        /**
         * @tc.name   testAdapt011AnimateTransformFillPropFreeze
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt011AnimateTransformFillPropFreeze', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillPropFreeze START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillPropFreeze);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillPropFreeze')
            expect(obj.$attrs.fill).assertEqual('freeze')
            console.info("[" + name + "Props] get fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testAdapt012AnimateTransformFillPropRemove
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt012AnimateTransformFillPropRemove', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FillPropRemove START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillPropRemove);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fillPropRemove')
            expect(obj.$attrs.fill).assertEqual('remove')
            console.info("[" + name + "Props] get fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testAdapt013AnimateTransformCalcModePropDiscrete
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt013AnimateTransformCalcModePropDiscrete', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropDiscrete START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropDiscrete);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropDiscrete')
            expect(obj.$attrs.calcmode).assertEqual('discrete')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
            done();
        });

        /**
         * @tc.name   testAdapt014AnimateTransformCalcModePropLinear
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt014AnimateTransformCalcModePropLinear', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropLinear START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropLinear);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropLinear')
            expect(obj.$attrs.calcmode).assertEqual('linear')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
            done();
        });

        /**
         * @tc.name   testAdapt015AnimateTransformCalcModePropPaced
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt015AnimateTransformCalcModePropPaced', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropPaced START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropPaced);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropPaced')
            expect(obj.$attrs.calcmode).assertEqual('Paced')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
            done();
        });

        /**
         * @tc.name   testAdapt016AnimateTransformCalcModePropSpline
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt016AnimateTransformCalcModePropSpline', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'CalcModePropSpline START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.calcModePropSpline);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('calcModePropSpline')
            expect(obj.$attrs.calcmode).assertEqual('spline')
            console.info("[" + name + "Props] get calcmode value is: " + JSON.stringify(obj.$attrs.calcmode));
            done();
        });

        /**
         * @tc.name   testAdapt017AnimateTransformKeyTimesProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt017AnimateTransformKeyTimesProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyTimesProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyTimesProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyTimesProp')
            expect(obj.$attrs.keytimes).assertEqual('0.3;0.6;0,9')
            console.info("[" + name + "Props] get keytimes value is: " + JSON.stringify(obj.$attrs.keytimes));
            done();
        });

        /**
         * @tc.name   testAdapt018AnimateTransformKeyTimesPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt018AnimateTransformKeyTimesPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyTimesPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyTimesPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyTimesPropNone')
            expect(obj.$attrs.keytimes).assertEqual(undefined)
            console.info("[" + name + "Props] get keytimes value is: " + JSON.stringify(obj.$attrs.keytimes));
            done();
        });

        /**
         * @tc.name   testAdapt019AnimateTransformKeySplinesProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt019AnimateTransformKeySplinesProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeySplinesProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keySplinesProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keySplinesProp')
            expect(obj.$attrs.keysplines).assertEqual('0.5 0 0.5 1')
            console.info("[" + name + "Props] get keysplines value is: " + JSON.stringify(obj.$attrs.keysplines));
            done();
        });

        /**
         * @tc.name   testAdapt020AnimateTransformKeySplinesPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt020AnimateTransformKeySplinesPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeySplinesPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keySplinesPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keySplinesPropNone')
            expect(obj.$attrs.keysplines).assertEqual(undefined)
            console.info("[" + name + "Props] get keysplines value is: " + JSON.stringify(obj.$attrs.keysplines));
            done();
        });

        /**
         * @tc.name   testAdapt021AnimateTransformByProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt021AnimateTransformByProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt022AnimateTransformByPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt022AnimateTransformByPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt023AnimateTransformFromProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt023AnimateTransformFromProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FromProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fromProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fromProp')
            expect(obj.$attrs.from).assertEqual('10')
            console.info("[" + name + "Props] get from value is: " + JSON.stringify(obj.$attrs.from));
            done();
        });

        /**
         * @tc.name   testAdapt024AnimateTransformFromPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt024AnimateTransformFromPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'FromPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fromPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('fromPropNone')
            expect(obj.$attrs.from).assertEqual(undefined)
            console.info("[" + name + "Props] get from value is: " + JSON.stringify(obj.$attrs.from));
            done();
        });

        /**
         * @tc.name   testAdapt025AnimateTransformToProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt025AnimateTransformToProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ToProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.toProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('toProp')
            expect(obj.$attrs.to).assertEqual('10')
            console.info("[" + name + "Props] get to value is: " + JSON.stringify(obj.$attrs.to));
            done();
        });

        /**
         * @tc.name   testAdapt026AnimateTransformToPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt026AnimateTransformToPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ToPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.toPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('toPropNone')
            expect(obj.$attrs.to).assertEqual(undefined)
            console.info("[" + name + "Props] get to value is: " + JSON.stringify(obj.$attrs.to));
            done();
        });

        /**
         * @tc.name   testAdapt027AnimateTransformValuesProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt027AnimateTransformValuesProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ValuesProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.valuesProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('valuesProp')
            expect(obj.$attrs.values).assertEqual('10;30')
            console.info("[" + name + "Props] get values value is: " + JSON.stringify(obj.$attrs.values));
            done();
        });

        /**
         * @tc.name   testAdapt028AnimateTransformValuesPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt028AnimateTransformValuesPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'ValuesPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.valuesPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('valuesPropNone')
            expect(obj.$attrs.values).assertEqual(undefined)
            console.info("[" + name + "Props] get values value is: " + JSON.stringify(obj.$attrs.values));
            done();
        });

        /**
         * @tc.name   testAdapt029AnimateTransformTypePropTranslate
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt029AnimateTransformTypePropTranslate', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'TypePropTranslate START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropTranslate);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('typePropTranslate')
            expect(obj.$attrs.type).assertEqual('translate')
            console.info("[" + name + "Props] get values type is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testAdapt030AnimateTransformTypePropScale
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt030AnimateTransformTypePropScale', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'TypePropScale START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropScale);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('typePropScale')
            expect(obj.$attrs.type).assertEqual('scale')
            console.info("[" + name + "Props] get values type is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testAdapt031AnimateTransformTypePropRotate
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt031AnimateTransformTypePropRotate', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'TypePropRotate START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropRotate);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('typePropRotate')
            expect(obj.$attrs.type).assertEqual('rotate')
            console.info("[" + name + "Props] get values type is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testAdapt032AnimateTransformTypePropSkewX
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt032AnimateTransformTypePropSkewX', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'TypePropSkewX START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropSkewX);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('typePropSkewX')
            expect(obj.$attrs.type).assertEqual('skewX')
            console.info("[" + name + "Props] get values type is: " + JSON.stringify(obj.$attrs.type));
            done();
        });

        /**
         * @tc.name   testAdapt033AnimateTransformTypePropSkewY
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt033AnimateTransformTypePropSkewY', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'TypePropSkewY START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.typePropSkewY);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('typePropSkewY')
            expect(obj.$attrs.type).assertEqual('skewY')
            console.info("[" + name + "Props] get values type is: " + JSON.stringify(obj.$attrs.type));
            done();
        });
    });
}