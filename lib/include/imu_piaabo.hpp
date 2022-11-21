#ifndef __TRANSFORMERS_PIAABO
#define __TRANSFORMERS_PIAABO
#include <string>
#include <vector>
#include "file_piaabo.hpp"
#include "util_piaabo.hpp"
#include "url_piaabo.hpp"

// class TextTransformerWrap {
// public:
//   std::vector<std::string> req_headers;
//   TextTransformerWrap():
//   req_headers({FILES::read_text_file(authorization_file.c_str())}){}
//   virtual ~TextTransformerWrap(){}
// public:
//   void generate_text(const char *input, REQUESTS::memory *output){
//     /* construct data */
//     std::string data = string_format("{\"inputs\":\"%s\",\"parameters\": {\"max_length\": 50}}",input);
//     /* consult transformer api */
//     REQUESTS::query(generate_text_url, req_headers, (void *)data.c_str(), std::strlen(data.c_str()), output);
//     /* clean the output */
//     clean_memory(output, std::vector({"[{\"generated_text\":\"","\"}]"}));
//   }
// };
#endif