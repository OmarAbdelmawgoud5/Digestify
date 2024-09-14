import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class TopicsButton extends StatelessWidget {
  const TopicsButton({super.key, required this.tag,required this.onPressed});
  final Tag tag;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      
      style: ElevatedButton.styleFrom(
        
     minimumSize: const Size(0,0),
    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
    
        foregroundColor: Theme.of(context).colorScheme.secondary,
        
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: const BorderSide(color: Colors.red),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        tag.tagName,
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
    );
  }
}
