FILE(REMOVE_RECURSE
  "CMakeFiles/glocalizer_generate_messages"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/glocalizer_generate_messages.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)