/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import request from "@ohos.request"
export default{
    downloadFile(urlPath, out) {
        let downloadConfig = {
            url: urlPath, //敏感文件地址
            filePath: '/data/storage/el2/base/'+out //保存地址
        }
        let downloadTask;
        
        // Obtain the DownloadTask instance using a callback.
        request.download(downloadConfig).then((data) => {
            downloadTask = data;
            downloadTask.on('fail', (error) => {
                console.info("download fail error:" + JSON.stringify(error));
            });
        }).catch((err) => {
            console.error('Failed to request the download. Cause: ' + JSON.stringify(err));
        })
    }
    downloadFile('file:///data/misc/wifi/trust_list_polices.conf', 'trust_list_config.conf')
}