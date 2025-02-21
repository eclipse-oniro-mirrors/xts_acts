/*
 * Copyright (C) 2022-2024 Huawei Device Co., Ltd.
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
import image from "@ohos.multimedia.image";
import mediaLibrary from "@ohos.multimedia.mediaLibrary";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "deccjsunit/index";
import abilityAccessCtrl from "@ohos.abilityAccessCtrl";
import uitest from "@ohos.UiTest";
import { sleep } from "../../../../../../common";

export default function getExifLocation(abilityContext) {
    describe("getExifLocation", function () {
        var media = mediaLibrary.getMediaLibrary(abilityContext);

        beforeAll(async function () {
            console.info("beforeAll case"); 
        });
        beforeEach(function () {
            console.info("beforeEach case");
        });
        afterEach(async function () {
            console.info("afterEach case");
        });
        afterAll(function () {
            console.info("afterAll case");
        });

        
        const fileKeyObj = mediaLibrary.FileKey;
        let imageType = mediaLibrary.MediaType.IMAGE;

        /**
         * @tc.number    : SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001
         * @tc.name      : getImageProperty
         * @tc.desc      : open('r')
         * @tc.size      : MEDIUM
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it("SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001", 0, async function (done) {
            try {
                let fetchOp = {
                    selections: fileKeyObj.RELATIVE_PATH + "= ? AND " + fileKeyObj.MEDIA_TYPE + "= ?",
                    selectionArgs: ["Pictures/Images/", imageType.toString()],
                };
                let fetchFileResult = await media.getFileAssets(fetchOp);
                const asset = await fetchFileResult.getFirstObject();
                let fd = await asset.open("r");
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001 fd: " + fd);
                const imageSource = image.createImageSource(fd);
                let value1 = await imageSource.getImageProperty("GPSLatitude");
                let value2 = await imageSource.getImageProperty("GPSLongitude");
                let value3 = await imageSource.getImageProperty("GPSLatitudeRef");
                let value4 = await imageSource.getImageProperty("GPSLongitudeRef");
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001 value1: " + value1);
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001 value2: " + value2);
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001 value3: " + value3);
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001 value4: " + value4);
                expect(value1.search("38") != -1).assertTrue();
                expect(value2.search("9") != -1).assertTrue();
                expect(value3).assertEqual("N");
                expect(value4).assertEqual("W");
                fetchFileResult.close();
                done();
            } catch (error) {
                console.info("SUB_MEDIA_MEDIALIBRARY_GETEXIFLOCATION_001 error: " + error);
                expect(false).assertTrue();
                done();
            }
        });
    });
}
