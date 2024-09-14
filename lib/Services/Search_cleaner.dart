const List<String> stopWords = [
  'a', 'about', 'above', 'after', 'again', 'against', 'all', 'am', 'an', 'and',
  'any', 'are', 'aren\'t', 'as', 'at', 'be', 'because', 'been', 'before', 'being',
  'below', 'between', 'both', 'but', 'by', 'can', 'could', 'did', 'didn\'t', 'do',
  'does', 'doesn\'t', 'doing', 'don\'t', 'down', 'during', 'each', 'few', 'for',
  'from', 'further', 'had', 'hadn\'t', 'has', 'hasn\'t', 'have', 'haven\'t', 'having',
  'he', 'her', 'here', 'hers', 'herself', 'him', 'himself', 'his', 'how', 'i', 'if',
  'in', 'into', 'is', 'isn\'t', 'it', 'its', 'itself', 'just', 'll', 'm', 'me', 'might',
  'more', 'most', 'mustn\'t', 'my', 'myself', 'need', 'needn\'t', 'no', 'nor', 'not',
  'now', 'o', 'of', 'off', 'on', 'once', 'only', 'or', 'other', 'our', 'ours', 'ourselves',
  'out', 'over', 'own', 're', 's', 'same', 'shan\'t', 'she', 'should', 'shouldn\'t',
  'so', 'some', 'such', 't', 'than', 'that', 'the', 'their', 'theirs', 'them', 'themselves',
  'then', 'there', 'these', 'they', 'this', 'those', 'through', 'to', 'too', 'under',
  'until', 'up', 've', 'very', 'was', 'wasn\'t', 'we', 'were', 'weren\'t', 'what', 'when',
  'where', 'which', 'while', 'who', 'whom', 'why', 'will', 'with', 'won\'t', 'would',
  'y', 'you', 'your', 'yours', 'yourself', 'yourselves'
];


String processString(String input) {
  
  String trimmed = input.trim();
  
  
  List<String> words = trimmed.split(RegExp(r'\s+'));
  List<String> filteredWords = words.where((word) {
    return !stopWords.contains(word.toLowerCase());
  }).toList();
  String withoutStopWords = filteredWords.join(' ');
  
  
  String finalString = withoutStopWords.replaceAll(RegExp(r'\s+'), '%20AND%20');
  
  return finalString;
}