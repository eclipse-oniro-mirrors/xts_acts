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

import escapBuffer from './EscapeChar/Escape_Buffer.test'
import emojiBuffer from './Emoji/Emoji_Buffer.test'
import emojiUtils from './Emoji/Emoji_Utils.test'
import emojiXml from './Emoji/Emoji_Xml.test'
import emojiUri from './Emoji/Emoji_Uri.test'
import emojiUtilsjson from './Emoji/Emoji_Utilsjson.test'
import escapeUtiljson from './EscapeChar/Escape_Utiljson.test'
import escapeXml from './EscapeChar/Escape_Xml.test'
import emojiUrl from './Emoji/Emoji_Url.test'
import escapeString from './EscapeChar/Escape_String.test'
import escapeRegexp from './EscapeChar/Escape_Regexp.test'
import emojiBuilintsString from './Emoji/Emoji_Builints_String.test'
import emojiBuilintsRegExp from './Emoji/Emoji_Builints_RegExp.test'
import escapeUrl from './EscapeChar/Escape_Url.test'

export default function testsuite() {
  escapBuffer();
  emojiBuffer();
  emojiUtils();
  emojiXml();
  emojiUri();
  emojiUtilsjson();
  escapeUtiljson();
  escapeXml();
  emojiUrl();
  escapeString();
  escapeRegexp();
  emojiBuilintsString();
  emojiBuilintsRegExp();
  escapeUrl();
}