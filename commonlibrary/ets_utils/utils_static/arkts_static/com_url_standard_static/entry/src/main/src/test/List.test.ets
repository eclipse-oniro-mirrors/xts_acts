/*
* Copyright (c) 2024 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import urlTest1 from "./url/Url1.test";
import urlTest2 from "./url/Url2.test";
import urlTest3 from "./url/Emoji_Url.test.ets";
import urlTest4 from "./url/Escape_Url.test.ets";
export default function testsuite() {
    urlTest1();
    urlTest2();
    urlTest3();
    urlTest4();
}
