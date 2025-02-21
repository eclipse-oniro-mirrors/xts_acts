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

export default function documentPickerCallback(abilityContext) {
    describe("documentPickerCallback", function () {
        afterEach(async function() {
            await sleep(500);
            await startAbility('ohos.acts.storage.picker', 'com.example.myapplication.MainAbility');
            await sleep(500);
        })

        async function select(testNum, done, dirName, fileName) {
            try {
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.select((err, result) => {
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
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.select(option, (err, result) => {
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
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.save((err, result) => {
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
                let documentPicker = new picker.DocumentViewPicker();
                documentPicker.save(option, (err, result) => {
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
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0000
         * @tc.name 	 : documentpicker_select_callback_000
         * @tc.desc 	 : select with option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_select_callback_000", 0, async function (done) {
            let testNum = "documentpicker_select_callback_000";
            let option = new picker.DocumentSelectOptions();
            let dirName = "Pictures";
            let fileName = "01.jpg";
            await selectWithOption(testNum, done, option, dirName, fileName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SELECT_CALLBACK_0100
         * @tc.name 	 : documentpicker_select_callback_001
         * @tc.desc 	 : select without option
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_select_callback_001", 0, async function (done) {
            let testNum = "documentpicker_select_callback_001";
            let dirName = "Pictures";
            let fileName = "01.jpg";
            await select(testNum, done, dirName, fileName);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0000
         * @tc.name 	 : documentpicker_save_callback_000
         * @tc.desc 	 : save image in Pictures
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 0
         */
        it("documentpicker_save_callback_000", 0, async function (done) {
            let testNum = "documentpicker_save_callback_000";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.jpg"];
            let saveDir = "Pictures";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0100
         * @tc.name 	 : documentpicker_save_callback_001
         * @tc.desc 	 : save file in Documents
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 1
         */
        it("documentpicker_save_callback_001", 0, async function (done) {
            let testNum = "documentpicker_save_callback_001";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.dat"];
            let saveDir = "Documents";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0200
         * @tc.name 	 : documentpicker_save_callback_002
         * @tc.desc 	 : save mp4 in Videos
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_callback_002", 0, async function (done) {
            let testNum = "documentpicker_save_callback_002";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.mp4"];
            let saveDir = "Videos";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0300
         * @tc.name 	 : documentpicker_save_callback_003
         * @tc.desc 	 : save mp3 in Audios
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_callback_003", 0, async function (done) {
            let testNum = "documentpicker_save_callback_003";
            let option = new picker.DocumentSaveOptions();
            option.newFileNames = ["DocumentViewPicker01.mp3"];
            let saveDir = "Audios";
            await saveWithOption(testNum, done, option, saveDir);
        });

        /**
         * @tc.number	 : SUB_STORAGE_DOCUMENTPICKER_SAVE_CALLBACK_0400
         * @tc.name 	 : documentpicker_save_callback_004
         * @tc.desc 	 : save without option, cancel
         * @tc.size 	 : MEDIUM
         * @tc.type 	 : Function
         * @tc.level	 : Level 3
         */
        it("documentpicker_save_callback_004", 0, async function (done) {
            let testNum = "documentpicker_save_callback_004";
            await saveWithoutSelect(testNum, done);
        });
    });
}
