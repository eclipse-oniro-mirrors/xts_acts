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
    describe('svgPropsJsTest', function() {

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
            console.info('[svgPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/svg/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push svgProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push svgProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[svgPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testSvgFillProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgFillProp', Level.LEVEL0, async function(done) {
            console.info('testSvgFillProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testSvgFillOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgFillOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgFillOpacityPropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('0.5')
            console.info("[svgProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testSvgFillOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgFillOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgFillOpacityPropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1')
            console.info("[svgProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testSvgFillOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgFillOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testSvgFillOpacityPropThree START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropThree);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropThree')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1.5')
            console.info("[svgProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testSvgFillRulePropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgFillRulePropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgFillRulePropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('evenodd')
            console.info("[svgProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testSvgFillRulePropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgFillRulePropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgFillRulePropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('nonzero')
            console.info("[svgProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testSvgOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgOpacityPropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('0.5')
            console.info("[lineProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testSvgOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgOpacityPropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('1')
            console.info("[svgProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testSvgOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testSvgOpacityPropThree START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropThree);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropThree')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.opacity).assertEqual('1.5')
            console.info("[svgProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testSvgStrokeProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeProp', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testSvgStrokeDashArrayProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeDashArrayProp', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeDashArrayProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashArrayProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashArrayProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDasharray).assertEqual('2 3')
            console.info("[svgProps] get inspector dasharray value is: " + JSON.stringify(obj.$attrs.strokeDasharray));
            done();
        });

        /**
         * @tc.name   testSvgStrokeDashOffsetProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeDashOffsetProp', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeDashOffsetProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashOffsetProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashOffsetProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDashoffset).assertEqual('23')
            console.info("[svgProps] get inspector dashoffset value is: " + JSON.stringify(obj.$attrs.strokeDashoffset));
            done();
        });


        /**
         * @tc.name   testSvgStrokeLineJoinPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeLineJoinPropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeLineJoinPropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('bevel')
            console.info("[svgProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testSvgStrokeLineJoinPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeLineJoinPropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeLineJoinPropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('miter')
            console.info("[svgProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testSvgStrokeLineJoinPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeLineJoinPropThree', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeLineJoinPropThree START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropThree);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropThree')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('round')
            console.info("[svgProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testSvgStrokeLineCapPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeLineCapPropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeLineCapPropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('butt')
            console.info("[svgProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testSvgStrokeLineCapPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeLineCapPropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeLineCapPropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('round')
            console.info("[svgProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testSvgStrokeLineCapPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeLineCapPropThree', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeLineCapPropThree START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropThree);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropThree')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('square')
            console.info("[svgProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testSvgStrokeMiterLimitProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeMiterLimitProp', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeMiterLimitProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeMiterLimitProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeMiterLimitProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeMiterlimit).assertEqual('10')
            console.info("[svgProps] get inspector miterlimit value is: " + JSON.stringify(obj.$attrs.strokeMiterlimit));
            done();
        });

        /**
         * @tc.name   testSvgStrokeOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeOpacityPropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('0.5')
            console.info("[svgProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testSvgStrokeOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeOpacityPropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1')
            console.info("[svgProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testSvgStrokeOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeOpacityPropThree START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropThree);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropThree')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1.5')
            console.info("[svgProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testSvgStrokeWidthProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgStrokeWidthProp', Level.LEVEL0, async function(done) {
            console.info('testSvgStrokeWidthProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeWidthProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeWidthProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[svgProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeWidth).assertEqual('6')
            console.info("[svgProps] get inspector stroke-width value is: " + JSON.stringify(obj.$attrs.strokeWidth));
            done();
        });

        /**
         * @tc.name   testSvgTransformProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgTransformProp', Level.LEVEL0, async function(done) {
            console.info('testSvgTransformProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.transformProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('transformProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.transform).assertEqual('translate(10,5)scale(0.5 1.3)rotate(20 40 90)skewX(10)skewY(-15)')
            console.info("[svgProps] get inspector transform value is: " + JSON.stringify(obj.$attrs.transform));
            done();
        });

        /**
         * @tc.name   testSvgIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgIdProp', Level.LEVEL0, async function(done) {
            console.info('testSvgIdProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('idProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('40px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            done();
        });

        /**
         * @tc.name   testSvgWidthPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgWidthPropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgWidthPropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.widthPropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('widthPropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testSvgWidthPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgWidthPropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgWidthPropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.widthPropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('widthPropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50%')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testSvgHeightPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgHeightPropOne', Level.LEVEL0, async function(done) {
            console.info('testSvgHeightPropOne START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.heightPropOne);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('heightPropOne')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testSvgHeightPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgHeightPropTwo', Level.LEVEL0, async function(done) {
            console.info('testSvgHeightPropTwo START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.heightPropTwo);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('heightPropTwo')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('50px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('20%')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[svgProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testSvgViewBoxProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testSvgViewBoxProp', Level.LEVEL0, async function(done) {
            console.info('testSvgViewBoxProp START');
            console.info("[svgProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.viewBoxProp);
            console.info("[svgProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[svgProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('svg')
            console.info("[svgProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('viewBoxProp')
            console.info("[svgProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.width).assertEqual('100px')
            console.info("[svgProps] get inspector width value is: " + JSON.stringify(obj.$attrs.width));
            expect(obj.$attrs.height).assertEqual('40px')
            console.info("[svgProps] get inspector height value is: " + JSON.stringify(obj.$attrs.height));
            expect(obj.$attrs.viewBox).assertEqual('0 0 20 20')
            console.info("[svgProps] get inspector viewBox value is: " + JSON.stringify(obj.$attrs.viewBox));
            done();
        });
    });
}