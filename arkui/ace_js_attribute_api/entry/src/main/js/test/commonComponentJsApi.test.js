/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import router from '@system.router';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';


export default function aceJsApiAndAttr() {
    describe('aceJsApiAndAttr', function() {

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
         * run after testcase
         */
        afterEach(async function() {
            console.info('[aceJsTest] after each called')
            await backToIndex();
            await sleep(5000)
        });

        /**
         * @tc.name   testVideoComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testVideoComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/video/router/index'
            }
            try {
                result = router.push(options)
                console.info("push video page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push video page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.video] getState" + JSON.stringify(pages));
            expect("pages/video/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testAnimateComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0200
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testAnimateComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/animate/router/index'
            }
            try {
                result = router.push(options)
                console.info("push animate page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push animate page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.animate] getState" + JSON.stringify(pages));
            expect("pages/animate/router/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testCameraComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0300
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCameraComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/camera/router/index'
            }
            try {
                result = router.push(options)
                console.info("push camera page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push camera page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.camera] getState" + JSON.stringify(pages));
            expect("pages/camera/router/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testCanvasComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0400
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testCanvasComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/canvas/router/index'
            }
            try {
                result = router.push(options)
                console.info("push canvas page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push canvas page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.canvas] getState" + JSON.stringify(pages));
            expect("pages/canvas/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testDivComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0500
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testDivComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/div/router/index'
            }
            try {
                result = router.push(options)
                console.info("push div page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push div page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.div] getState" + JSON.stringify(pages));
            expect("pages/div/router/").assertEqual(pages.path);
            done();
        });


        /**
         * @tc.name   testInputComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0600
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testInputComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/input/router/index'
            }
            try {
                result = router.push(options)
                console.info("push input page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push input page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.input] getState" + JSON.stringify(pages));
            expect("pages/input/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testListComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0700
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testListComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/list/router/index'
            }
            try {
                result = router.push(options)
                console.info("push list page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push list page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.list] getState" + JSON.stringify(pages));
            expect("pages/list/router/").assertEqual(pages.path);
            done();
        });

        /**
         * @tc.name   testTextComponent
         * @tc.number SUB_ACE_BASIC_COMPONENT_JS_API_0800
         * @tc.desc   ACE
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('testTextComponent', Level.LEVEL0, async function(done) {
            let result;
            let options = {
                uri: 'pages/text/router/index'
            }
            try {
                result = router.push(options)
                console.info("push text page success " + JSON.stringify(result));
            } catch (err) {
                console.error("push text page error " + JSON.stringify(result));
            }
            await sleep(5000)
            let pages = router.getState();
            console.info("[router.text] getState" + JSON.stringify(pages));
            expect("pages/text/router/").assertEqual(pages.path);
            done();
        });
    });
}