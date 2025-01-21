/*
 * Copyright (C) 2023 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import { sleep, startAbility } from "./Common"
import picker from '@ohos.file.picker'

export default function audioPickerCallback(abilityContext) {
    describe("audioPickerCallback", function () {
        afterEach(async function() {
            await sleep(500);
            await startAbility('ohos.acts.storage.picker', 'com.example.myapplication.MainAbility');
            await sleep(500);
        })

        async function select(testNum, done, dirName, fileName) {
            try {
                let audioPicker = new picker.AudioViewPicker();
                audioPicker.select((err, result) => {
                    if (err != undefined) {
                        console.info(`${testNum}::select fail, err: ${JSON.stringify(err)}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}::select result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(1);
                    done();
                });
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::select error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function selectWithOption(testNum, done, option, dirName, fileName) {
            try {
                let audioPicker = new picker.AudioViewPicker();
                audioPicker.select(option, (err, result) => {
                    if (err != undefined) {
                        console.info(`${testNum}::selectWithOption fail, err: ${JSON.stringify(err)}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}::selectWithOption result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(1);
                    done();
                });
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::selectWithOption error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function saveWithoutSelect(testNum, done) {
            try {
                let audioPicker = new picker.AudioViewPicker();
                audioPicker.save((err, result) => {
                    if (err != undefined) {
                        console.info(`${testNum}::saveWithoutSelect err: ${JSON.stringify(err)}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}::saveWithoutSelect result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(0);
                    done();
                });
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::saveWithoutSelect error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        async function saveWithOption(testNum, done, option, dirName) {
            try {
                let audioPicker = new picker.AudioViewPicker();
                audioPicker.save(option, (err, result) => {
                    if (err != undefined) {
                        console.info(`${testNum}::saveWithOption err: ${JSON.stringify(err)}`);
                        expect(false).assertTrue();
                        done();
                        return;
                    }
                    console.info(`${testNum}::saveWithOption result: ${JSON.stringify(result)}`);
                    expect(result.length).assertEqual(1);
                    done();
                });
                expect(true).assertTrue();
                done();
            } catch (error) {
                console.info(`${testNum}::saveWithOption error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        }

        /**
         * @tc.number	 : SUB_STORAGE_AUDIOPICKER_SELECT_CALLBACK_0000
         * @tc.name 	 : audiopicker_select_callback_000
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 0
         */
        it("audiopicker_select_callback_000", 0, async function (done) {
            let testNum = "audiopicker_select_callback_000";
            let option = new picker.AudioSelectOptions();
            let dirName = "Audios";
            let fileName = "01.mp3";
            await selectWithOption(testNum, done, option, dirName, fileName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_AUDIOPICKER_SELECT_CALLBACK_0100
         * @tc.name 	 : audiopicker_select_callback_001
         * @tc.desc 	 : select without option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("audiopicker_select_callback_001", 0, async function (done) {
            let testNum = "audiopicker_select_callback_001";
            let dirName = "Audios";
            let fileName = "01.mp3";
            await select(testNum, done, dirName, fileName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_AUDIOPICKER_SAVE_CALLBACK_0000
         * @tc.name 	 : audiopicker_save_callback_000
         * @tc.desc 	 : save mp3 in Audios
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 0
         */
        it("audiopicker_save_callback_000", 0, async function (done) {
            let testNum = "audiopicker_save_callback_000";
            let option = new picker.AudioSaveOptions();
            option.newFileNames = ["AudioViewPicker01.mp3"];
            let saveDir = "Audios";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_AUDIOPICKER_SAVE_CALLBACK_0100
         * @tc.name 	 : audiopicker_save_callback_001
         * @tc.desc 	 : save without option, cancel
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 0
         */
        it("audiopicker_save_callback_001", 0, async function (done) {
            let testNum = "audiopicker_save_callback_001";
            await saveWithoutSelect(testNum, done);
        });
    });
}
