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


export default function aceJsTest() {
    describe('aceJsTest', function() {

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
         * @tc.number    SUB_ACE_BASIC_COMPONENT_JS_API_0100
         * @tc.name      testVideoComponent
         * @tc.desc      ACE
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
    });
}