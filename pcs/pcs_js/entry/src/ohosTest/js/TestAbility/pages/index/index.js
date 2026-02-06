/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http:// www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import file from '@system.file';

export default {
    data: {
        title: "",
        absolutionPathImageComplete: 'AbsolutionPathFail',
        relativePathImageCompleted1: 'RelativePath1Fail',
        relativePathImageCompleted2: 'RelativePath2Fail',
        relativePathImageCompleted3: 'RelativePath3Fail',
        fileText1: ""
    },
    onInit() {
        this.title = this.$t('strings.world');
        this.writeText1()
        sleep(2000)
        this.readtext1()
    },
    onComplete1(event) {
        this.absolutionPathImageComplete = 'AbsolutionPathSuccess'
        this.appendToFile(this.absolutionPathImageComplete + '+')
    },
    onComplete2(event) {
        this.relativePathImageCompleted1 = 'RelativePath1Success'
        this.appendToFile(this.relativePathImageCompleted1 + '+')
    },
    onComplete3(event) {
        this.relativePathImageCompleted2 = 'RelativePath2Success'
        this.appendToFile(this.relativePathImageCompleted2 + '+')
    },
    onComplete4(event) {
        this.relativePathImageCompleted3 = 'RelativePath3Success'
        this.appendToFile(this.relativePathImageCompleted3 + '+')
    },
    writeText1() {
        file.writeText({
            uri: "internal://app/test.txt",
            text: 'test text',
            success: function () {
                console.info('write file success');
            },
            fail: function (data, code) {
                console.error('write file fail, code: ' + code + ', data: ' + data)
            },
        })
    },
    readtext1() {
        console.info('read text');
        let that = this
        file.readText({
            uri: 'internal://app/test.txt',
            success: function (data) {
                that.fileText1 = data.text
                console.info('read file success. that.fileText1111 = ' + that.fileText1);
            },
            fail: function (data, code) {
                console.error('read file fail , code: ' + code + ', data: ' + data);
            },
        })
    },
    appendToFile(text) {
        file.writeText({
            uri: 'internal://app/result.txt',
            text: text,
            append: true,
            success: function() {
                console.log('call writeText success.');
            },
            fail: function(data, code) {
                console.error('call fail callback fail, code: ' + code + ', data: ' + data);
            },
        });
    }
}

function sleep(time) {
    return new Promise((resolve) => setTimeout(resolve, time));
}