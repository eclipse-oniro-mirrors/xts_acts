/*
* Copyright (C) 2024 HiHope Open Source Organization.
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*   http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

export let URL1: string = "https://"
export let URL2: string = "www.example.com"
export let URL: string = URL1 + URL2

export class CommonConstants {
  static readonly URL_HTTPS_EXAMPLE: string = 'https://www.example.com';

  static readonly URL_HTTP_EXAMPLE: string = 'http://www.example.com';

  static readonly URL_HTTPS_EXPIREDBADSSL: string = 'https://expired.badssl.com/';

  static readonly URL_HTTPS_BAIDU: string = 'https://www.baidu.com';

}