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
    describe('pathPropsJsTest', function() {

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
            console.info('[pathPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/path/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push pathProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push pathProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[pathPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testPathFillProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathFillProp', Level.LEVEL0, async function(done) {
            console.info('testPathFillProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testPathFillOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathFillOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testPathFillOpacityPropOne START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropOne);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropOne')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('0.5')
            console.info("[pathProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testPathFillOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathFillOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testPathFillOpacityPropTwo START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropTwo);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropTwo')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1')
            console.info("[pathProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testPathFillOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathFillOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testPathFillOpacityPropThree START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropThree);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropThree')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1.5')
            console.info("[pathProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testPathFillRulePropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathFillRulePropOne', Level.LEVEL0, async function(done) {
            console.info('testPathFillRulePropOne START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropOne);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropOne')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('evenodd')
            console.info("[pathProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testPathFillRulePropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathFillRulePropTwo', Level.LEVEL0, async function(done) {
            console.info('testPathFillRulePropTwo START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropTwo);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropTwo')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('nonzero')
            console.info("[pathProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testPathOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testPathOpacityPropOne START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropOne);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropOne')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('0.5')
            console.info("[pathProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testPathOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testPathOpacityPropTwo START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropTwo);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropTwo')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('1')
            console.info("[pathProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testPathOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testPathOpacityPropThree START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropThree);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropThree')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[pathProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('1.5')
            console.info("[pathProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testPathStrokeProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeProp', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testPathStrokeDashArrayProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeDashArrayProp', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeDashArrayProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashArrayProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashArrayProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDasharray).assertEqual('2 3')
            console.info("[pathProps] get inspector dasharray value is: " + JSON.stringify(obj.$attrs.strokeDasharray));
            done();
        });

        /**
         * @tc.name   testPathStrokeDashOffsetProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeDashOffsetProp', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeDashOffsetProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashOffsetProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashOffsetProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDashoffset).assertEqual('23')
            console.info("[pathProps] get inspector dashoffset value is: " + JSON.stringify(obj.$attrs.strokeDashoffset));
            done();
        });


        /**
         * @tc.name   testPathStrokeLineJoinPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeLineJoinPropOne', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeLineJoinPropOne START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropOne);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropOne')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('bevel')
            console.info("[pathProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testPathStrokeLineJoinPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeLineJoinPropTwo', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeLineJoinPropTwo START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropTwo);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropTwo')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('miter')
            console.info("[pathProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testPathStrokeLineJoinPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeLineJoinPropThree', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeLineJoinPropThree START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropThree);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropThree')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('round')
            console.info("[pathProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testPathStrokeLineCapPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeLineCapPropOne', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeLineCapPropOne START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropOne);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropOne')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('butt')
            console.info("[pathProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testPathStrokeLineCapPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeLineCapPropTwo', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeLineCapPropTwo START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropTwo);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropTwo')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('round')
            console.info("[pathProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testPathStrokeLineCapPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeLineCapPropThree', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeLineCapPropThree START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropThree);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropThree')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('square')
            console.info("[pathProps] get inspector stroke-lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testPathStrokeMiterLimitProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeMiterLimitProp', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeMiterLimitProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeMiterLimitProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeMiterLimitProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeMiterlimit).assertEqual('10')
            console.info("[pathProps] get inspector miterlimit value is: " + JSON.stringify(obj.$attrs.strokeMiterlimit));
            done();
        });

        /**
         * @tc.name   testPathStrokeOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeOpacityPropOne START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropOne);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropOne')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('0.5')
            console.info("[pathProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testPathStrokeOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeOpacityPropTwo START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropTwo);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropTwo')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1')
            console.info("[pathProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testPathStrokeOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeOpacityPropThree START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropThree);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropThree')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1.5')
            console.info("[pathProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testPathStrokeWidthProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathStrokeWidthProp', Level.LEVEL0, async function(done) {
            console.info('testPathStrokeWidthProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeWidthProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeWidthProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,12 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[pathProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeWidth).assertEqual('6')
            console.info("[pathProps] get inspector stroke-width value is: " + JSON.stringify(obj.$attrs.strokeWidth));
            done();
        });

        /**
         * @tc.name   testPathTransformProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathTransformProp', Level.LEVEL0, async function(done) {
            console.info('testPathTransformProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.transformProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('transformProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,35 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            expect(obj.$attrs.transform).assertEqual('translate(10,5)scale(0.5 1.3)rotate(20 40 90)skewX(10)skewY(-15)')
            console.info("[pathProps] get inspector transform value is: " + JSON.stringify(obj.$attrs.transform));
            done();
        });

        /**
         * @tc.name   testPathIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathIdProp', Level.LEVEL0, async function(done) {
            console.info('testPathIdProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('idProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,35 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            done();
        });

        /**
         * @tc.name   testPathdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testPathdProp', Level.LEVEL0, async function(done) {
            console.info('testPathdProp START');
            console.info("[pathProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dProp);
            console.info("[pathProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[pathProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('path')
            console.info("[pathProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('dProp')
            console.info("[pathProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.d).assertEqual('m10,35 c0,-40 40,40 40,0 c0,-40 -40,40 -40,0 z')
            console.info("[pathProps] get inspector d value is: " + JSON.stringify(obj.$attrs.d));
            done();
        });
    });
}