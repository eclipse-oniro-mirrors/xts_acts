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
    describe('ellipsePropsJsTest', function() {

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
            console.info('[ellipsePropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/ellipse/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push ellipseProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push ellipseProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[ellipsePropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.name   testEllipseFillProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseFillProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseFillProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('60')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testEllipseFillOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseFillOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseFillOpacityPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('0.5')
            console.info("[ellipseProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testEllipseFillOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseFillOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseFillOpacityPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1')
            console.info("[ellipseProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testEllipseFillOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseFillOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testEllipseFillOpacityPropThree START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillOpacityPropThree);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillOpacityPropThree')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillOpacity).assertEqual('1.5')
            console.info("[ellipseProps] get inspector fill-opacity value is: " + JSON.stringify(obj.$attrs.fillOpacity));
            done();
        });

        /**
         * @tc.name   testEllipseFillRulePropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseFillRulePropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseFillRulePropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('evenodd')
            console.info("[ellipseProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testEllipseFillRulePropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseFillRulePropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseFillRulePropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.fillRulePropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('fillRulePropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            expect(obj.$attrs.fillRule).assertEqual('nonzero')
            console.info("[ellipseProps] get inspector fill-rule value is: " + JSON.stringify(obj.$attrs.fillRule));
            done();
        });

        /**
         * @tc.name   testEllipseOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseOpacityPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.opacity).assertEqual('0.5')
            console.info("[ellipseProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testEllipseOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseOpacityPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.opacity).assertEqual('1')
            console.info("[ellipseProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testEllipseOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testEllipseOpacityPropThree START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.opacityPropThree);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('opacityPropThree')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.opacity).assertEqual('1.5')
            console.info("[ellipseProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.opacity));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('60')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeDashArrayProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeDashArrayProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeDashArrayProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashArrayProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashArrayProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('60')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDasharray).assertEqual('2 3')
            console.info("[ellipseProps] get inspector dasharray value is: " + JSON.stringify(obj.$attrs.strokeDasharray));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeDashOffsetProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeDashOffsetProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeDashOffsetProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeDashOffsetProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeDashOffsetProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('60')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeDashoffset).assertEqual('23')
            console.info("[ellipseProps] get dashoffset value is: " + JSON.stringify(obj.$attrs.strokeDashoffset));
            done();
        });


        /**
         * @tc.name   testEllipseStrokeLineJoinPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeLineJoinPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeLineJoinPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('bevel')
            console.info("[ellipseProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeLineJoinPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeLineJoinPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeLineJoinPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('miter')
            console.info("[ellipseProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeLineJoinPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeLineJoinPropThree', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeLineJoinPropThree START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineJoinPropThree);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineJoinPropThree')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLinejoin).assertEqual('round')
            console.info("[ellipseProps] get inspector linejoin value is: " + JSON.stringify(obj.$attrs.strokeLinejoin));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeLineCapPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeLineCapPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeLineCapPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('butt')
            console.info("[ellipseProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeLineCapPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeLineCapPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeLineCapPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('round')
            console.info("[ellipseProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeLineCapPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeLineCapPropThree', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeLineCapPropThree START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeLineCapPropThree);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeLineCapPropThree')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeLineCap).assertEqual('square')
            console.info("[ellipseProps] get inspector lineCap value is: " + JSON.stringify(obj.$attrs.strokeLineCap));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeMiterLimitProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeMiterLimitProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeMiterLimitProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeMiterLimitProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeMiterLimitProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('60')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeMiterlimit).assertEqual('10')
            console.info("[ellipseProps] get miterlimit value is: " + JSON.stringify(obj.$attrs.strokeMiterlimit));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeOpacityPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeOpacityPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeOpacityPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('0.5')
            console.info("[ellipseProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeOpacityPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeOpacityPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeOpacityPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1')
            console.info("[ellipseProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeOpacityPropThree
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeOpacityPropThree', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeOpacityPropThree START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeOpacityPropThree);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeOpacityPropThree')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeOpacity).assertEqual('1.5')
            console.info("[ellipseProps] get inspector opacity value is: " + JSON.stringify(obj.$attrs.strokeOpacity));
            done();
        });

        /**
         * @tc.name   testEllipseStrokeWidthProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseStrokeWidthProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseStrokeWidthProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.strokeWidthProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('strokeWidthProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('60')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            expect(obj.$attrs.strokeWidth).assertEqual('6')
            console.info("[ellipseProps] get inspector stroke-width value is: " + JSON.stringify(obj.$attrs.strokeWidth));
            done();
        });

        /**
         * @tc.name   testEllipseTransformProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseTransformProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseTransformProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.transformProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('transformProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('11')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.transform).assertEqual('translate(10,5)scale(0.5 1.3)rotate(20 40 90)skewX(10)skewY(-15)')
            console.info("[ellipseProps] get inspector transform value is: " + JSON.stringify(obj.$attrs.transform));
            done();
        });

        /**
         * @tc.name   testEllipseIdProp
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseIdProp', Level.LEVEL0, async function(done) {
            console.info('testEllipseIdProp START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('idProp')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            done();
        });

        /**
         * @tc.name   testEllipseCxPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseCxPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseCxPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.cxPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('cxPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testEllipseCxPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseCxPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseCxPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.cxPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('cxPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('50%')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('pink')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testEllipseCyPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseCyPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseCyPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.cyPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('cyPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('red')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testEllipseCyPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseCyPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseCyPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.cyPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('cyPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('80')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('50%')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.fill).assertEqual('pink')
            console.info("[ellipseProps] get inspector fill value is: " + JSON.stringify(obj.$attrs.fill));
            done();
        });

        /**
         * @tc.name   testEllipseRxPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseRxPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseRxPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rxPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('rxPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testEllipseRxPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseRxPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseRxPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.rxPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('rxPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('100')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25%')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('pink')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testEllipseRyPropOne
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseRyPropOne', Level.LEVEL0, async function(done) {
            console.info('testEllipseRyPropOne START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ryPropOne);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('ryPropOne')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('25')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('red')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });

        /**
         * @tc.name   testEllipseRyPropTwo
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testEllipseRyPropTwo', Level.LEVEL0, async function(done) {
            console.info('testEllipseRyPropTwo START');
            console.info("[ellipseProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ryPropTwo);
            console.info("[ellipseProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[ellipseProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('ellipse')
            console.info("[ellipseProps] get inspector $type value is: " + JSON.stringify(obj.$attrs.$type));
            expect(obj.$attrs.id).assertEqual('ryPropTwo')
            console.info("[ellipseProps] get inspector id value is: " + JSON.stringify(obj.$attrs.id));
            expect(obj.$attrs.cx).assertEqual('100')
            console.info("[ellipseProps] get inspector cx value is: " + JSON.stringify(obj.$attrs.cx));
            expect(obj.$attrs.cy).assertEqual('20')
            console.info("[ellipseProps] get inspector cy value is: " + JSON.stringify(obj.$attrs.cy));
            expect(obj.$attrs.rx).assertEqual('25')
            console.info("[ellipseProps] get inspector rx value is: " + JSON.stringify(obj.$attrs.rx));
            expect(obj.$attrs.ry).assertEqual('10%')
            console.info("[ellipseProps] get inspector ry value is: " + JSON.stringify(obj.$attrs.ry));
            expect(obj.$attrs.stroke).assertEqual('pink')
            console.info("[ellipseProps] get inspector stroke value is: " + JSON.stringify(obj.$attrs.stroke));
            done();
        });
    });
}