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
    describe('toolbarPropsJsTest3', function() {

        var name = 'animateMotion',
            nameA = 'AnimateMotion',
            labelName = 'animateMotion';

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
         * @tc.name   testAnimateMotionIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAnimateMotionIdProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt001AnimateMotionAttributeNameProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt001AnimateMotionAttributeNameProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt002AnimateMotionAttributeNamePropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt002AnimateMotionAttributeNamePropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt003AnimateMotionBeginProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt003AnimateMotionBeginProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt004AnimateMotionBeginPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt004AnimateMotionBeginPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt005AnimateMotionDurProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt005AnimateMotionDurProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt006AnimateMotionDurPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt006AnimateMotionDurPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt007AnimateMotionEndProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt007AnimateMotionEndProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt008AnimateMotionEndPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt008AnimateMotionEndPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt009AnimateMotionRepeatCountProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt009AnimateMotionRepeatCountProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt010AnimateMotionRepeatCountPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt010AnimateMotionRepeatCountPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt011AnimateMotionFillPropFreeze
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt011AnimateMotionFillPropFreeze', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt012AnimateMotionFillPropRemove
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt012AnimateMotionFillPropRemove', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt013AnimateMotionCalcModePropDiscrete
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt013AnimateMotionCalcModePropDiscrete', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt014AnimateMotionCalcModePropLinear
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt014AnimateMotionCalcModePropLinear', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt015AnimateMotionCalcModePropPaced
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt015AnimateMotionCalcModePropPaced', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt016AnimateMotionCalcModePropSpline
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt016AnimateMotionCalcModePropSpline', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt017AnimateMotionKeyTimesProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt017AnimateMotionKeyTimesProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt018AnimateMotionKeyTimesPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt018AnimateMotionKeyTimesPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt019AnimateMotionKeySplinesProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt019AnimateMotionKeySplinesProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt020AnimateMotionKeySplinesPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt020AnimateMotionKeySplinesPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt021AnimateMotionByProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt021AnimateMotionByProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt022AnimateMotionByPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt022AnimateMotionByPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt023AnimateMotionFromProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt023AnimateMotionFromProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt024AnimateMotionFromPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt024AnimateMotionFromPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt025AnimateMotionToProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt025AnimateMotionToProp', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt026AnimateMotionToPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt026AnimateMotionToPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt027AnimateMotionKeyPointsProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt027AnimateMotionKeyPointsProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyPointsProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyPointsProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyPointsProp')
            expect(obj.$attrs.keypoints).assertEqual('0;0.2;0.4;0.6;0.8;1')
            console.info("[" + name + "Props] get keypoints value is: " + JSON.stringify(obj.$attrs.keypoints));
            done();
        });

        /**
         * @tc.name   testAdapt028AnimateMotionKeyPointsPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt028AnimateMotionKeyPointsPropNone', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'KeyPointsPropNone START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.keyPointsPropNone);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('keyPointsPropNone')
            expect(obj.$attrs.keypoints).assertEqual(undefined)
            console.info("[" + name + "Props] get keypoints value is: " + JSON.stringify(obj.$attrs.keypoints));
            done();
        });

        /**
         * @tc.name   testAdapt029AnimateMotionPathProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt029AnimateMotionPathProp', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'PathProp START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.pathProp);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('pathProp')
            expect(obj.$attrs.path).assertEqual('m40,130 c0,-100 160,100 160,0 c0,-100,-160,100 -160,0 z')
            console.info("[" + name + "Props] get path value is: " + JSON.stringify(obj.$attrs.path));
            done();
        });

        /**
         * @tc.name   testAdapt030AnimateMotionPathPropNone
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt030AnimateMotionPathPropNone', Level.LEVEL0, async function(done) {
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
         * @tc.name   testAdapt031AnimateMotionRotatePropRotate
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt031AnimateMotionRotatePropRotate', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RotatePropRotate START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rotatePropRotate);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('rotatePropRotate')
            expect(obj.$attrs.rotate).assertEqual('rotate')
            console.info("[" + name + "Props] get rotate value is: " + JSON.stringify(obj.$attrs.rotate));
            done();
        });

        /**
         * @tc.name   testAdapt032AnimateMotionRotatePropAutoReverse
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt032AnimateMotionRotatePropAutoReverse', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RotatePropAutoReverse START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rotatePropAutoReverse);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('rotatePropAutoReverse')
            expect(obj.$attrs.rotate).assertEqual('auto-reverse')
            console.info("[" + name + "Props] get rotate value is: " + JSON.stringify(obj.$attrs.rotate));
            done();
        });

        /**
         * @tc.name   testAdapt033AnimateMotionRotatePropNumber
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAdapt033AnimateMotionRotatePropNumber', Level.LEVEL0, async function(done) {
            console.info('test' + nameA + 'RotatePropNumber START');
            console.info("[" + name + "Props] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rotatePropNumber);
            console.info("[" + name + "Props] get inspector value is: " + JSON.stringify(obj));
            console.info("[" + name + "Props] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual(labelName)
            expect(obj.$attrs.id).assertEqual('rotatePropNumber')
            expect(obj.$attrs.rotate).assertEqual('45')
            console.info("[" + name + "Props] get rotate value is: " + JSON.stringify(obj.$attrs.rotate));
            done();
        });
    });
}