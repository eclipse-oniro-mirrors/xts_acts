/*
 	  * Copyright (c) 2026 Huawei Device Co., Ltd.
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
 	 
#ifndef JSONWRAPPER_H
#define JSONWRAPPER_H
 	 
#include <string>
#include <unordered_map>
 	 
class JsonWrapper {
public:
    // 加载 JSON 文件
    bool LoadFromFile(const std::string& path);
    
    // 获取对应 fileName + pixFmt 的字符串
    std::string GetString(const std::string& fileName, const std::string& pixFmt) const;
 	 
private:
    std::string content_;
 	 
    // 一级 key -> 二级 key -> value
    std::unordered_map<std::string, std::unordered_map<std::string, std::string>> data_;
 	 
    // 内部辅助函数
    static std::string Trim(const std::string& s);
    static std::string StripQuotes(const std::string& s);
    bool ParseTopLevel();
    std::unordered_map<std::string, std::string> ParseInnerObject(size_t& pos);
    std::string ParseString(size_t& pos);
    void SkipWhitespace(size_t& pos);
};
 	 
#endif // JSONWRAPPER_H