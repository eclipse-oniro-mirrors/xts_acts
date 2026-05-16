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
    describe('rectPropsJsTest', function() {

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
            console.info('[rectPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/rect/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push rectProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push rectProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[rectPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testRectFillProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectFillProp', Level.LEVEL0, async function(done) {
            console.info('testRectFillProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testRectFillOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectFillOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testRectFillOpacityPropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('0.5')
            console.info("[rectProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testRectFillOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectFillOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectFillOpacityPropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1')
            console.info("[rectProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testRectFillOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectFillOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testRectFillOpacityPropThree START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropThree);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropThree')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1.5')
            console.info("[rectProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testRectFillRulePropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectFillRulePropOne', Level.LEVEL0, async function(done) {
            console.info('testRectFillRulePropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('evenodd')
            console.info("[rectProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testRectFillRulePropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectFillRulePropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectFillRulePropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('nonzero')
            console.info("[rectProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testRectOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testRectOpacityPropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('0.5')
            console.info("[rectProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testRectOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectOpacityPropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('1')
            console.info("[rectProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testRectOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testRectOpacityPropThree START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropThree);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropThree')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('1.5')
            console.info("[rectProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testRectStrokeProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeProp', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testRectStrokeDashArrayProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeDashArrayProp', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeDashArrayProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashArrayProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashArrayProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDasharray).assertEqual('2 3')
            console.info("[rectProps] get inspector dasharray value is: " + JSON.stringify(obj.$attrs.strokeDasharray));
            done();
        });

        /**
         * @tc.name   testRectStrokeDashOffsetProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeDashOffsetProp', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeDashOffsetProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashOffsetProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashOffsetProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDashoffset).assertEqual('23')
            console.info("[rectProps] get inspector dashoffset value is: " + JSON.stringify(obj.$attrs.strokeDashoffset));
            done();
        });


        /**
         * @tc.name   testRectStrokeLineJoinPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeLineJoinPropOne', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeLineJoinPropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('bevel')
            console.info("[rectProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testRectStrokeLineJoinPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeLineJoinPropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeLineJoinPropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('miter')
            console.info("[rectProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testRectStrokeLineJoinPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeLineJoinPropThree', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeLineJoinPropThree START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropThree);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropThree')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('round')
            console.info("[rectProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testRectStrokeLineJoinPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeLineJoinPropOne', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeLineJoinPropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('butt')
            console.info("[rectProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testRectStrokeLineCapPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeLineCapPropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeLineCapPropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('round')
            console.info("[rectProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testRectStrokeLineCapPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeLineCapPropThree', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeLineCapPropThree START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropThree);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropThree')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('square')
            console.info("[rectProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testRectStrokeMiterLimitProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeMiterLimitProp', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeMiterLimitProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeMiterLimitProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeMiterLimitProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeMiterlimit).assertEqual('10')
            console.info("[rectProps] get inspector miterlimit value is: " + JSON.stringify(obj.$attrs.strokeMiterlimit));
            done();
        });

        /**
         * @tc.name   testRectStrokeOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeOpacityPropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('0.5')
            console.info("[rectProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testRectStrokeOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeOpacityPropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1')
            console.info("[rectProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testRectStrokeOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeOpacityPropThree START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropThree);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropThree')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1.5')
            console.info("[rectProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testRectStrokeWidthProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectStrokeWidthProp', Level.LEVEL0, async function(done) {
            console.info('testRectStrokeWidthProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeWidthProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeWidthProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[rectProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeWidth).assertEqual('6')
            console.info("[rectProps] get inspector stroke-width value is: " + JSON.stringify(obj.$attrs.strokeWidth));
            done();
        });

        /**
         * @tc.name   testRectTransformProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectTransformProp', Level.LEVEL0, async function(done) {
            console.info('testRectTransformProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.transformProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('transformProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('100px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.transform).assertEqual('translate(10,5)scale(0.5 1.3)rotate(20 40 90)skewX(10)skewY(-15)')
            console.info("[rectProps] get inspector transform value is: " + JSON.stringify(obj.$attrs.transform));
            done();
        });

        /**
         * @tc.name   testRectIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectIdProp', Level.LEVEL0, async function(done) {
            console.info('testRectIdProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('idProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testRectWidthPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectWidthPropOne', Level.LEVEL0, async function(done) {
            console.info('testRectWidthPropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.widthPropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('widthPropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90px')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            done();
        });

        /**
         * @tc.name   testRectWidthPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectWidthPropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectWidthPropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.widthPropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('widthPropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90%')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            done();
        });

        /**
         * @tc.name   testRectHeightPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectHeightPropOne', Level.LEVEL0, async function(done) {
            console.info('testRectHeightPropOne START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.heightPropOne);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('heightPropOne')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90%')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            done();
        });

        /**
         * @tc.name   testRectHeightPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectHeightPropTwo', Level.LEVEL0, async function(done) {
            console.info('testRectHeightPropTwo START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.heightPropTwo);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('heightPropTwo')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90%')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('80%')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            done();
        });

        /**
         * @tc.name   testRectXProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectXProp', Level.LEVEL0, async function(done) {
            console.info('testRectXProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.xProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('xProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90%')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.x).assertEqual('20')
            console.info("[rectProps] get inspector x value is: " + JSON.stringify(obj.$attrs.x));
            done();
        });

        /**
         * @tc.name   testRectYProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectYProp', Level.LEVEL0, async function(done) {
            console.info('testRectYProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.yProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('yProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90%')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.y).assertEqual('20')
            console.info("[rectProps] get inspector y value is: " + JSON.stringify(obj.$attrs.y));
            done();
        });

        /**
         * @tc.name   testRectRxProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectRxProp', Level.LEVEL0, async function(done) {
            console.info('testRectRxProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rxProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('rxProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90%')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.rx).assertEqual('20')
            console.info("[rectProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            done();
        });

        /**
         * @tc.name   testRectRyProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testRectRyProp', Level.LEVEL0, async function(done) {
            console.info('testRectRyProp START');
            console.info("[rectProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ryProp);
            console.info("[rectProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[rectProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('rect')
            console.info("[rectProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('ryProp')
            console.info("[rectProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('90%')
            console.info("[rectProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[rectProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.ry).assertEqual('20')
            console.info("[rectProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            done();
        });
    });
}