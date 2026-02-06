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


export default function videoPropsJsTest() {
    describe('videoPropsJsTest', function() {

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
            console.info('[videoPropsJsTest] before each called')

            let result;
            let options = {
                uri: 'pages/video/prop/index'
            }
            try {
                result = router.push(options)
                console.info("push videoProps page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push videoProps page error " + JSON.stringify(result));
            }
            await sleep(4000)
            done()
        });

        /**
         * run after testcase
         */
        afterAll(async function() {
            console.info('[videoPropsJsTest] after each called')
            await backToIndex()
            await sleep(1000)
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoIdProp
         * @tc.desc      ACE
         */
        it('testVideoIdProp', Level.LEVEL0, async function(done) {
            console.info('testVideoIdProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.idProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('idProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoClassProp
         * @tc.desc      ACE
         */
        it('testVideoClassProp', Level.LEVEL0, async function(done) {
            console.info('testVideoClassProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('classProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoClassPropNone
         * @tc.desc      ACE
         */
        it('testVideoClassPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoClassPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.classPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('classPropNone')
            expect(obj.$attrs.className).assertEqual(undefined)
            console.info("[videoProps] get className value is: " + JSON.stringify(obj.$attrs.className));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoRefProp
         * @tc.desc      ACE
         */
        it('testVideoRefProp', Level.LEVEL0, async function(done) {
            console.info('testVideoRefProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('refProp')
            expect(obj.$attrs.ref).assertEqual('refProp')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoRefPropNone
         * @tc.desc      ACE
         */
        it('testVideoRefPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoRefPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.refPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('refPropNone')
            expect(obj.$attrs.ref).assertEqual(undefined)
            console.info("[videoProps] get ref value is: " + JSON.stringify(obj.$attrs.ref));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDisabledPropTrue
         * @tc.desc      ACE
         */
        it('testVideoDisabledPropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoDisabledPropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('disabledPropTrue')
            expect(obj.$attrs.disabled).assertEqual('true')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDisabledPropFalse
         * @tc.desc      ACE
         */
        it('testVideoDisabledPropFalse', Level.LEVEL0, async function(done) {
            console.info('testVideoDisabledPropFalse START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.disabledPropFalse);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('disabledPropFalse')
            expect(obj.$attrs.disabled).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoFocusablePropTrue
         * @tc.desc      ACE
         */
        it('testVideoFocusablePropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoFocusablePropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('focusablePropTrue')
            expect(obj.$attrs.focusable).assertEqual('true')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoFocusablePropFalse
         * @tc.desc      ACE
         */
        it('testVideoFocusablePropFalse', Level.LEVEL0, async function(done) {
            console.info('testVideoFocusablePropFalse START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.focusablePropFalse);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('focusablePropFalse')
            expect(obj.$attrs.focusable).assertEqual('false')
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDataProp
         * @tc.desc      ACE
         */
        it('testVideoDataProp', Level.LEVEL0, async function(done) {
            console.info('testVideoDataProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('dataProp')
            expect(obj.$attrs.dataDiv).assertEqual(undefined);
            console.info("[videoProps] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDataPropNone
         * @tc.desc      ACE
         */
        it('testVideoDataPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoDataPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.dataPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('dataPropNone')
            expect(obj.$attrs.dataDiv).assertEqual(undefined)
            console.info("[videoProps] get dataDiv value is: " + JSON.stringify(obj.$attrs.dataDiv));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoForPropNull
         * @tc.desc      ACE
         */
        it('testVideoForPropNull', Level.LEVEL0, async function(done) {
            console.info('testVideoForPropNull START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropNull);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('forPropNull')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[videoProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoForPropOne
         * @tc.desc      ACE
         */
        it('testVideoForPropOne', Level.LEVEL0, async function(done) {
            console.info('testVideoForPropOne START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropOne);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('forPropOne')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[videoProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoForPropThree
         * @tc.desc      ACE
         */
        it('testVideoForPropThree', Level.LEVEL0, async function(done) {
            console.info('testVideoForPropThree START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.forPropThree);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('forPropThree')
            expect(obj.$attrs.for).assertEqual(undefined)
            console.info("[videoProps] get for value is: " + JSON.stringify(obj.$attrs.for));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoIfPropTrue
         * @tc.desc      ACE
         */
        it('testVideoIfPropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoIfPropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.ifPropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('ifPropTrue')
            expect(obj.$attrs.if).assertEqual(undefined)
            console.info("[videoProps] get for value is: " + JSON.stringify(obj.$attrs.if));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoShowPropTrue
         * @tc.desc      ACE
         */
        it('testVideoShowPropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoShowPropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('showPropTrue')
            expect(obj.$attrs.show).assertEqual('true')
            console.info("[videoProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoShowPropFalse
         * @tc.desc      ACE
         */
        it('testVideoShowPropFalse', Level.LEVEL0, async function(done) {
            console.info('testVideoShowPropFalse START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.showPropFalse);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('showPropFalse')
            expect(obj.$attrs.show).assertEqual('false')
            console.info("[videoProps] get show value is: " + JSON.stringify(obj.$attrs.show));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoMutedPropFalse
         * @tc.desc      ACE
         */
        it('testVideoMutedPropFalse', Level.LEVEL0, async function(done) {
            console.info('testVideoMutedPropFalse START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.mutedPropFalse);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('mutedPropFalse')
            expect(obj.$attrs.muted).assertEqual('false')
            console.info("[videoProps] get muted value is: " + JSON.stringify(obj.$attrs.muted));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoMutedPropTrue
         * @tc.desc      ACE
         */
        it('testVideoMutedPropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoMutedPropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.mutedPropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('mutedPropTrue')
            expect(obj.$attrs.muted).assertEqual('true')
            console.info("[videoProps] get muted value is: " + JSON.stringify(obj.$attrs.muted));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoSrcProp
         * @tc.desc      ACE
         */
        it('testVideoSrcProp', Level.LEVEL0, async function(done) {
            console.info('testVideoSrcProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.srcProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('srcProp')
            expect(obj.$attrs.src).assertEqual('/common/images/video.mp4')
            console.info("[videoProps] get src value is: " + JSON.stringify(obj.$attrs.src));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoSrcPropNone
         * @tc.desc      ACE
         */
        it('testVideoSrcPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoSrcPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.srcPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('srcPropNone')
            expect(obj.$attrs.src).assertEqual(undefined)
            console.info("[videoProps] get src value is: " + JSON.stringify(obj.$attrs.src));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoAutoplayPropFalse
         * @tc.desc      ACE
         */
        it('testVideoAutoplayPropFalse', Level.LEVEL0, async function(done) {
            console.info('testVideoAutoplayPropFalse START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.autoplayPropFalse);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('autoplayPropFalse')
            expect(obj.$attrs.autoplay).assertEqual('false')
            console.info("[videoProps] get autoplay value is: " + JSON.stringify(obj.$attrs.autoplay));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoAutoplayPropTrue
         * @tc.desc      ACE
         */
        it('testVideoAutoplayPropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoAutoplayPropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.autoplayPropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('autoplayPropTrue')
            expect(obj.$attrs.autoplay).assertEqual('true')
            console.info("[videoProps] get autoplay value is: " + JSON.stringify(obj.$attrs.autoplay));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoPosterProp
         * @tc.desc      ACE
         */
        it('testVideoPosterProp', Level.LEVEL0, async function(done) {
            console.info('testVideoPosterProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.posterProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('posterProp')
            expect(obj.$attrs.poster).assertEqual('/common/images/image.png')
            console.info("[videoProps] get poster value is: " + JSON.stringify(obj.$attrs.poster));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoPosterPropNone
         * @tc.desc      ACE
         */
        it('testVideoPosterPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoPosterPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.posterPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('posterPropNone')
            expect(obj.$attrs.poster).assertEqual(undefined)
            console.info("[videoProps] get poster value is: " + JSON.stringify(obj.$attrs.poster));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoControlsPropFalse
         * @tc.desc      ACE
         */
        it('testVideoControlsPropFalse', Level.LEVEL0, async function(done) {
            console.info('testVideoControlsPropFalse START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.controlsPropFalse);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('controlsPropFalse')
            expect(obj.$attrs.controls).assertEqual('false')
            console.info("[videoProps] get controls value is: " + JSON.stringify(obj.$attrs.controls));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoControlsPropTrue
         * @tc.desc      ACE
         */
        it('testVideoControlsPropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoControlsPropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.controlsPropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('controlsPropTrue')
            expect(obj.$attrs.controls).assertEqual('true')
            console.info("[videoProps] get controls value is: " + JSON.stringify(obj.$attrs.controls));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoLoopPropFalse
         * @tc.desc      ACE
         */
        it('testVideoLoopPropFalse', Level.LEVEL0, async function(done) {
            console.info('testVideoLoopPropFalse START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.loopPropFalse);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('loopPropFalse')
            expect(obj.$attrs.loop).assertEqual('false')
            console.info("[videoProps] get loop value is: " + JSON.stringify(obj.$attrs.loop));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoLoopPropTrue
         * @tc.desc      ACE
         */
        it('testVideoLoopPropTrue', Level.LEVEL0, async function(done) {
            console.info('testVideoLoopPropTrue START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.loopPropTrue);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('loopPropTrue')
            expect(obj.$attrs.loop).assertEqual('true')
            console.info("[videoProps] get loop value is: " + JSON.stringify(obj.$attrs.loop));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoLoopPropNone
         * @tc.desc      ACE
         */
        it('testVideoLoopPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoLoopPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.loopPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('loopPropNone')
            expect(obj.$attrs.loop).assertEqual('false')
            console.info("[videoProps] get loop value is: " + JSON.stringify(obj.$attrs.loop));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoStarttimeProp
         * @tc.desc      ACE
         */
        it('testVideoStarttimeProp', Level.LEVEL0, async function(done) {
            console.info('testVideoStarttimeProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.starttimeProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('starttimeProp')
            expect(obj.$attrs.starttime).assertEqual('3')
            console.info("[videoProps] get starttime value is: " + JSON.stringify(obj.$attrs.starttime));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDirectionPropAuto
         * @tc.desc      ACE
         */
        it('testVideoDirectionPropAuto', Level.LEVEL0, async function(done) {
            console.info('testVideoDirectionPropAuto START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.directionPropAuto);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('directionPropAuto')
            expect(obj.$attrs.direction).assertEqual('auto')
            console.info("[videoProps] get direction value is: " + JSON.stringify(obj.$attrs.direction));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDirectionPropVertical
         * @tc.desc      ACE
         */
        it('testVideoDirectionPropVertical', Level.LEVEL0, async function(done) {
            console.info('testVideoDirectionPropVertical START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.directionPropVertical);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('directionPropVertical')
            expect(obj.$attrs.direction).assertEqual('vertical')
            console.info("[videoProps] get direction value is: " + JSON.stringify(obj.$attrs.direction));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDirectionPropHorizontal
         * @tc.desc      ACE
         */
        it('testVideoDirectionPropHorizontal', Level.LEVEL0, async function(done) {
            console.info('testVideoDirectionPropHorizontal START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.directionPropHorizontal);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('directionPropHorizontal')
            expect(obj.$attrs.direction).assertEqual('horizontal')
            console.info("[videoProps] get direction value is: " + JSON.stringify(obj.$attrs.direction));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDirectionPropAdapt
         * @tc.desc      ACE
         */
        it('testVideoDirectionPropAdapt', Level.LEVEL0, async function(done) {
            console.info('testVideoDirectionPropAdapt START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.directionPropAdapt);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('directionPropAdapt')
            expect(obj.$attrs.direction).assertEqual('adapt')
            console.info("[videoProps] get direction value is: " + JSON.stringify(obj.$attrs.direction));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoDirectionPropNone
         * @tc.desc      ACE
         */
        it('testVideoDirectionPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoDirectionPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.directionPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('directionPropNone')
            expect(obj.$attrs.direction).assertEqual('auto')
            console.info("[videoProps] get direction value is: " + JSON.stringify(obj.$attrs.direction));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoSpeedProp
         * @tc.desc      ACE
         */
        it('testVideoSpeedProp', Level.LEVEL0, async function(done) {
            console.info('testVideoSpeedProp START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.speedProp);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('speedProp')
            expect(obj.$attrs.speed).assertEqual('1.0')
            console.info("[videoProps] get speed value is: " + JSON.stringify(obj.$attrs.speed));
            done();
        });

        /**
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoSpeedPropNone
         * @tc.desc      ACE
         */
        it('testVideoSpeedPropNone', Level.LEVEL0, async function(done) {
            console.info('testVideoSpeedPropNone START');
            console.info("[videoProps] get globalThis.value is: " + JSON.stringify(globalThis.value));

            let obj = JSON.parse(globalThis.value.speedPropNone);
            console.info("[videoProps] get inspector value is: " + JSON.stringify(obj));
            console.info("[videoProps] get inspector attrs value is: " + JSON.stringify(obj.$attrs));

            expect(obj.$type).assertEqual('video')
            expect(obj.$attrs.id).assertEqual('speedPropNone')
            expect(obj.$attrs.speed).assertEqual('1')
            console.info("[videoProps] get speed value is: " + JSON.stringify(obj.$attrs.speed));
            done();
        });
    });
}