import 'package:flutter/material.dart';
import 'package:tpm_responsi_123220094/model/model.dart';
import 'package:tpm_responsi_123220094/pages/addmovie.dart';
import 'package:tpm_responsi_123220094/pages/detailmovie.dart';
import 'package:tpm_responsi_123220094/pages/updatemovie.dart';
import 'package:tpm_responsi_123220094/services/services.dart';

class MovieWidget extends StatelessWidget {

  final movie Movie;
    const MovieWidget({Key? key,required this.Movie,required this.onDeleted}) : super(key: key);
  final VoidCallback onDeleted;

  Widget _buildCircleButton({
    required IconData icon,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? iconColor,
  }) {
    return Container(
      width: 36,
      height: 36,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.blue,
        shape: BoxShape.circle,
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        icon: Icon(icon, size: 18, color: iconColor ?? Colors.white),
        onPressed: onPressed,
        splashRadius: 20,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Movie.title ?? 'Unknown',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 4),
            Text('Year: ${Movie.year}'),
            Text('Rating: ${Movie.rating}'),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildCircleButton(
                  icon: Icons.edit,
                  backgroundColor: Colors.orange,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Updatemovie(Movie: Movie),
                      ),
                    );
                  },
                ),
                const SizedBox(width: 8),
                _buildCircleButton(
                  icon: Icons.delete,
                  backgroundColor: Colors.red,
                  onPressed: () async {
                    try {
                      await UserApi.deleteMovie(
                          Movie.id.toString());
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Data Deleted")),
                      );
                      onDeleted();
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Delete Failed")),
                      );
                    }
                  },
                ),
                const SizedBox(width: 8),
                _buildCircleButton(
                  icon: Icons.info_outline,
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            Detailmovie(id: Movie.id!),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}